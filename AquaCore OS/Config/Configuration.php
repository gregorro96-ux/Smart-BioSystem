<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

final class Configuration
{
    public function __construct(
        private readonly Environment $environment,
        private readonly string $appName,
        private readonly string $timezone,
        private readonly DatabaseConfig $database,
        private readonly MqttConfig $mqtt,
        private readonly bool $localOverrideLoaded = false,
    ) {
    }

    public function environment(): Environment
    {
        return $this->environment;
    }

    public function appName(): string
    {
        return $this->appName;
    }

    public function timezone(): string
    {
        return $this->timezone;
    }

    public function database(): DatabaseConfig
    {
        return $this->database;
    }

    public function mqtt(): MqttConfig
    {
        return $this->mqtt;
    }

    public function localOverrideLoaded(): bool
    {
        return $this->localOverrideLoaded;
    }

    public function debugEnabled(): bool
    {
        return $this->environment->debugEnabled();
    }

    public function logLevel(): string
    {
        return $this->environment->logLevel();
    }

    public function toArray(): array
    {
        return [
            'app_name' => $this->appName,
            'environment' => $this->environment->value,
            'debug' => $this->debugEnabled() ? 'true' : 'false',
            'log_level' => $this->logLevel(),
            'timezone' => $this->timezone,
            'local_override_loaded' => $this->localOverrideLoaded ? 'true' : 'false',
        ];
    }
}