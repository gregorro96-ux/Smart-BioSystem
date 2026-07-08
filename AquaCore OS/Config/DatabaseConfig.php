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
        private readonly string $password,
    ) {
    }

    public function configured(): bool
    {
        return $this->configured;
    }

    public function driver(): string
    {
        return $this->driver;
    }

    public function host(): string
    {
        return $this->host;
    }

    public function port(): int
    {
        return $this->port;
    }

    public function database(): string
    {
        return $this->database;
    }

    public function username(): string
    {
        return $this->username;
    }

    public function password(): string
    {
        return $this->password;
    }

    public function toArray(): array
    {
        return [
            'configured' => $this->configured ? 'true' : 'false',
            'driver' => $this->driver,
            'host' => $this->host,
            'port' => (string) $this->port,
            'database' => $this->database,
            'username_configured' => $this->username !== '' ? 'true' : 'false',
            'password_configured' => $this->password !== '' ? 'true' : 'false',
        ];
    }
}
