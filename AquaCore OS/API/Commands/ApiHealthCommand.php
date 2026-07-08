<?php

declare(strict_types=1);

namespace AquaCoreOS\API\Commands;

use AquaCoreOS\API\HealthStatusProvider;
use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Security\AuthProviderInterface;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\BootSequence;
use AquaCoreOS\System\ModuleStatusProvider;
use AquaCoreOS\System\SystemStatus;

final class ApiHealthCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
        private readonly SystemStatus $systemStatus,
        private readonly ModuleStatusProvider $moduleStatusProvider,
        private readonly BootSequence $bootSequence,
        private readonly AuthProviderInterface $authProvider,
    ) {
    }

    public function name(): string
    {
        return 'api:health';
    }

    public function description(): string
    {
        return 'Shows private health/status API payload without starting an HTTP server.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" api:health [--live]';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('API health command executed.');
        $liveChecks = in_array('--live', $arguments, true);

        $provider = new HealthStatusProvider(
            $this->configuration,
            $this->systemStatus,
            $this->moduleStatusProvider,
            $this->bootSequence,
            $this->authProvider,
        );

        echo json_encode($provider->payload($liveChecks)->toArray(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) . PHP_EOL;

        return 0;
    }
}