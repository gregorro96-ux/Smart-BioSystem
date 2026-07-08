<?php

declare(strict_types=1);

namespace AquaCoreOS\API;

use AquaCoreOS\Compatibility\MqttConnectionTester;
use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Database\MariaDbDatabaseConnection;
use AquaCoreOS\Security\AuthProviderInterface;
use AquaCoreOS\System\BootSequence;
use AquaCoreOS\System\ModuleStatusProvider;
use AquaCoreOS\System\SystemStatus;

final class HealthStatusProvider
{
    public function __construct(
        private readonly Configuration $configuration,
        private readonly SystemStatus $systemStatus,
        private readonly ModuleStatusProvider $moduleStatusProvider,
        private readonly BootSequence $bootSequence,
        private readonly AuthProviderInterface $authProvider,
    ) {
    }

    public function payload(bool $liveChecks): ApiResponse
    {
        return ApiResponse::success(
            'api.health.ok',
            'AquaCore OS health payload generated.',
            [
                'mode' => $liveChecks ? 'live' : 'snapshot',
                'system' => $this->systemStatus->getStatus(),
                'configuration' => [
                    'environment' => $this->configuration->environment()->value,
                    'timezone' => $this->configuration->timezone(),
                    'local_override_loaded' => $this->configuration->localOverrideLoaded(),
                ],
                'modules' => array_map(
                    static fn ($module): array => $module->toArray(),
                    $this->moduleStatusProvider->all(),
                ),
                'boot' => array_map(
                    static fn ($step): array => [
                        'name' => $step->name(),
                        'successful' => $step->isSuccessful(),
                        'message' => $step->message(),
                    ],
                    $this->bootSequence->run(),
                ),
                'security' => [
                    'context' => $this->authProvider->currentUser()->toArray(),
                    'login' => 'not_implemented',
                    'http_session' => 'not_started',
                ],
                'checks' => [
                    'database' => $this->databaseCheck($liveChecks),
                    'mqtt' => $this->mqttCheck($liveChecks),
                ],
                'api' => [
                    'public_endpoints' => 'none',
                    'private_endpoints' => 'not_exposed',
                    'http_server' => 'not_started',
                ],
            ],
        );
    }

    private function databaseCheck(bool $liveChecks): array
    {
        $database = $this->configuration->database();

        if (!$liveChecks) {
            return [
                'configured' => $database->configured(),
                'connection_test' => 'not_executed',
                'diagnostic_code' => 'snapshot_only',
            ];
        }

        $result = (new MariaDbDatabaseConnection($database))->test();

        return [
            'configured' => $database->configured(),
            'connection_test' => $result->status(),
            'diagnostic_code' => $result->diagnosticCode(),
            'message' => $result->message(),
            'schema_changes' => 'none',
        ];
    }

    private function mqttCheck(bool $liveChecks): array
    {
        $mqtt = $this->configuration->mqtt();

        if (!$liveChecks) {
            return [
                'configured' => $mqtt->configured(),
                'connection_test' => 'not_executed',
                'diagnostic_code' => 'snapshot_only',
            ];
        }

        $result = (new MqttConnectionTester($mqtt))->test();

        return [
            'configured' => $mqtt->configured(),
            'connection_test' => $result->status(),
            'diagnostic_code' => $result->diagnosticCode(),
            'message' => $result->message(),
            'publish_operation' => $result->publishOperation(),
            'subscribe_operation' => $result->subscribeOperation(),
            'broker_changes' => 'none',
        ];
    }
}