<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

use RuntimeException;

final class ConfigLoader
{
    public function load(string $rootPath): Configuration
    {
        $configFile = $rootPath . DIRECTORY_SEPARATOR . 'Config' . DIRECTORY_SEPARATOR . 'aquacore.php';
        $config = is_file($configFile) ? require $configFile : [];

        if (!is_array($config)) {
            throw new RuntimeException('AquaCore OS configuration file must return an array.');
        }

        $environment = Environment::tryFrom((string) ($config['environment'] ?? Environment::Development->value));

        if ($environment === null) {
            throw new RuntimeException('Invalid AquaCore OS environment value.');
        }

        $database = $config['database'] ?? [];
        $mqtt = $config['mqtt'] ?? [];

        return new Configuration(
            $environment,
            (string) ($config['app_name'] ?? 'AquaCore OS'),
            (string) ($config['timezone'] ?? 'Europe/Warsaw'),
            new DatabaseConfig(
                (bool) ($database['configured'] ?? false),
                (string) ($database['driver'] ?? 'mysql'),
                (string) ($database['host'] ?? 'localhost'),
                (int) ($database['port'] ?? 3306),
                (string) ($database['database'] ?? 'sbs'),
                (string) ($database['username'] ?? 'aquacore'),
            ),
            new MqttConfig(
                (bool) ($mqtt['configured'] ?? false),
                (string) ($mqtt['host'] ?? 'localhost'),
                (int) ($mqtt['port'] ?? 1883),
                (string) ($mqtt['client_id'] ?? 'aquacore-os'),
                (string) ($mqtt['base_topic'] ?? 'mqtt/sbs'),
            ),
        );
    }
}
