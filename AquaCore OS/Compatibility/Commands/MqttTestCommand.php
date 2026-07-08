<?php

declare(strict_types=1);

namespace AquaCoreOS\Compatibility\Commands;

use AquaCoreOS\Compatibility\MqttConnectionTester;
use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class MqttTestCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
    ) {
    }

    public function name(): string
    {
        return 'mqtt:test';
    }

    public function description(): string
    {
        return 'Tests MQTT broker connection without publishing or subscribing.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" mqtt:test';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('MQTT test command executed.');
        $result = (new MqttConnectionTester($this->configuration->mqtt()))->test();

        echo 'mqtt_layer: ready' . PHP_EOL;
        echo 'broker_connection: ' . $result->status() . PHP_EOL;
        echo 'diagnostic_code: ' . $result->diagnosticCode() . PHP_EOL;
        echo 'message: ' . $result->message() . PHP_EOL;
        echo 'publish_operation: ' . $result->publishOperation() . PHP_EOL;
        echo 'subscribe_operation: ' . $result->subscribeOperation() . PHP_EOL;
        echo 'broker_changes: none' . PHP_EOL;

        return $result->successful() ? 0 : 1;
    }
}