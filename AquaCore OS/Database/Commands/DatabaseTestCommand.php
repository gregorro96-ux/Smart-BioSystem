<?php

declare(strict_types=1);

namespace AquaCoreOS\Database\Commands;

use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Database\MariaDbDatabaseConnection;
use AquaCoreOS\Logging\Logger;

final class DatabaseTestCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
    ) {
    }

    public function name(): string
    {
        return 'database:test';
    }

    public function description(): string
    {
        return 'Tests MariaDB connection when database configuration is enabled.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" database:test';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Database test command executed.');
        $connection = new MariaDbDatabaseConnection($this->configuration->database());
        $result = $connection->test();

        echo 'database_layer: ready' . PHP_EOL;
        echo 'mariadb_connection: ' . $result->status() . PHP_EOL;
        echo 'message: ' . $result->message() . PHP_EOL;
        echo 'schema_changes: none' . PHP_EOL;

        return $result->successful() ? 0 : 1;
    }
}
