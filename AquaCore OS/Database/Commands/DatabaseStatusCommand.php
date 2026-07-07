<?php

declare(strict_types=1);

namespace AquaCoreOS\Database\Commands;

use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class DatabaseStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
    ) {
    }

    public function name(): string
    {
        return 'database:status';
    }

    public function description(): string
    {
        return 'Shows database configuration status without connecting to MariaDB.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" database:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Database status command executed.');

        foreach ($this->configuration->database()->toArray() as $key => $value) {
            echo sprintf("%s: %s%s", $key, $value, PHP_EOL);
        }

        echo 'connection_test: not executed' . PHP_EOL;

        return 0;
    }
}
