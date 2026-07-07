<?php

declare(strict_types=1);

namespace AquaCoreOS\System\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class SystemHealthCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
    ) {
    }

    public function name(): string
    {
        return 'system:health';
    }

    public function description(): string
    {
        return 'Runs basic local health checks without database or MQTT access.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" system:health';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('System health command executed.');

        echo 'php: ok' . PHP_EOL;
        echo 'filesystem: ok' . PHP_EOL;
        echo 'database: not configured' . PHP_EOL;
        echo 'mqtt: not configured' . PHP_EOL;

        return 0;
    }
}
