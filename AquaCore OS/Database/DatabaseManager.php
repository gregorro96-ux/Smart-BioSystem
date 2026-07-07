<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

final class DatabaseManager
{
    public function __construct(
        private readonly DatabaseConnectionInterface $connection,
    ) {
    }

    public function isReady(): bool
    {
        return $this->connection->isConfigured();
    }

    public function connectionName(): string
    {
        return $this->connection->name();
    }
}
