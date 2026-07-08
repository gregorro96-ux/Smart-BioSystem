<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

use AquaCoreOS\Config\DatabaseConfig;
use PDO;
use PDOException;

final class MariaDbDatabaseConnection implements DatabaseConnectionInterface
{
    public function __construct(
        private readonly DatabaseConfig $configuration,
    ) {
    }

    public function isConfigured(): bool
    {
        return $this->configuration->configured();
    }

    public function name(): string
    {
        return $this->isConfigured() ? 'MariaDB' : 'not configured';
    }

    public function test(): DatabaseTestResult
    {
        if (!$this->isConfigured()) {
            return DatabaseTestResult::skipped('MariaDB connection is not configured.');
        }

        if ($this->configuration->driver() !== 'mysql') {
            return DatabaseTestResult::failure('Unsupported database driver.');
        }

        if (!extension_loaded('pdo_mysql')) {
            return DatabaseTestResult::failure('PDO MySQL extension is not available.');
        }

        try {
            $pdo = new PDO(
                $this->dsn(),
                $this->configuration->username(),
                $this->configuration->password(),
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_TIMEOUT => 5,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                ],
            );

            $pdo->query('SELECT 1');
        } catch (PDOException) {
            return DatabaseTestResult::failure('MariaDB connection failed.');
        }

        return DatabaseTestResult::success('MariaDB connection successful.');
    }

    private function dsn(): string
    {
        return sprintf(
            'mysql:host=%s;port=%d;dbname=%s;charset=utf8mb4',
            $this->configuration->host(),
            $this->configuration->port(),
            $this->configuration->database(),
        );
    }
}
