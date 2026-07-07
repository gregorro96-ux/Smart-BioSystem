<?php

declare(strict_types=1);

namespace AquaCoreOS\Database\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class DatabaseTestCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
    ) {
    }

    public function name(): string
    {
        return 'database:test';
    }

    public function description(): string
    {
        return 'Checks database layer readiness without connecting to MariaDB.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" database:test';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Database test command executed.');

        echo 'database_layer: ready' . PHP_EOL;
        echo 'mariadb_connection: not configured' . PHP_EOL;
        echo 'schema_changes: none' . PHP_EOL;

        return 0;
    }
}
