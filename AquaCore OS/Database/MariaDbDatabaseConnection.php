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
            return DatabaseTestResult::failure('Unsupported database driver.', 'unsupported_driver');
        }

        if (!extension_loaded('pdo_mysql')) {
            return DatabaseTestResult::failure('PDO MySQL extension is not available.', 'pdo_mysql_missing');
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
        } catch (PDOException $exception) {
            return DatabaseTestResult::failure('MariaDB connection failed.', $this->diagnosticCode($exception));
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

    private function diagnosticCode(PDOException $exception): string
    {
        $code = (string) $exception->getCode();
        $message = strtolower($exception->getMessage());

        if ($code === '1045' || str_contains($message, 'access denied')) {
            return 'access_denied';
        }

        if ($code === '1049' || str_contains($message, 'unknown database')) {
            return 'unknown_database';
        }

        if ($code === '2005' || str_contains($message, 'unknown mysql server host')) {
            return 'host_not_found';
        }

        if (
            $code === '2002'
            || str_contains($message, 'connection refused')
            || str_contains($message, 'actively refused')
            || str_contains($message, 'timed out')
            || str_contains($message, 'no connection could be made')
        ) {
            return 'connection_unavailable';
        }

        if ($code === '2006' || str_contains($message, 'server has gone away')) {
            return 'server_unavailable';
        }

        return 'pdo_exception';
    }
}
