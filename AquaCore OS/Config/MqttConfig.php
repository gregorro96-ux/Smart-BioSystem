<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

final class MqttConfig
{
    public function __construct(
        private readonly bool $configured,
        private readonly string $host,
        private readonly int $port,
        private readonly string $clientId,
        private readonly string $baseTopic,
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
            'host' => $this->host,
            'port' => (string) $this->port,
            'client_id' => $this->clientId,
            'base_topic' => $this->baseTopic,
        ];
    }
}
