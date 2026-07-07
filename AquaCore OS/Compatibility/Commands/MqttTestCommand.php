<?php

declare(strict_types=1);

namespace AquaCoreOS\Compatibility\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class MqttTestCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
    ) {
    }

    public function name(): string
    {
        return 'mqtt:test';
    }

    public function description(): string
    {
        return 'Checks MQTT module readiness without connecting to broker.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" mqtt:test';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('MQTT test command executed.');

        echo 'mqtt_layer: planned' . PHP_EOL;
        echo 'broker_connection: not configured' . PHP_EOL;
        echo 'topics_loaded: none' . PHP_EOL;

        return 0;
    }
}
