<?php

declare(strict_types=1);

namespace AquaCoreOS\Compatibility\Commands;

use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class MqttStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
    ) {
    }

    public function name(): string
    {
        return 'mqtt:status';
    }

    public function description(): string
    {
        return 'Shows MQTT configuration status without connecting to broker.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" mqtt:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('MQTT status command executed.');

        foreach ($this->configuration->mqtt()->toArray() as $key => $value) {
            echo sprintf("%s: %s%s", $key, $value, PHP_EOL);
        }

        echo 'connection_test: not executed' . PHP_EOL;

        return 0;
    }
}
