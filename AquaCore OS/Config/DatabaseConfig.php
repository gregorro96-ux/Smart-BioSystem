<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

final class DatabaseConfig
{
    public function __construct(
        private readonly bool $configured,
        private readonly string $driver,
        private readonly string $host,
        private readonly int $port,
        private readonly string $database,
        private readonly string $username,
    ) {
    }

    public function configured(): bool
    {
        return $this->configured;
    }

    public function toArray(): array
    {
        return [
            'configured' => $this->configured ? 'true' : 'false',
            'driver' => $this->driver,
            'host' => $this->host,
            'port' => (string) $this->port,
            'database' => $this->database,
            'username' => $this->username,
        ];
    }
}
