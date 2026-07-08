<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

use RuntimeException;

final class ConfigLoader
{
    public function load(string $rootPath): Configuration
    {
        $configDirectory = $rootPath . DIRECTORY_SEPARATOR . 'Config';
        $configFile = $configDirectory . DIRECTORY_SEPARATOR . 'aquacore.php';
        $config = $this->loadConfigFile($configFile, true);
        $localConfigFiles = $this->localConfigFiles($configDirectory);

        foreach ($localConfigFiles as $localConfigFile) {
            $config = $this->mergeConfig($config, $this->loadConfigFile($localConfigFile, false));
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
            $localConfigFiles !== [],
        );
    }

    /**
     * @return array<string, mixed>
     */
    private function loadConfigFile(string $path, bool $required): array
    {
        if (!is_file($path)) {
            if ($required) {
                throw new RuntimeException('AquaCore OS configuration file is missing.');
            }

            return [];
        }

        $config = require $path;

        if (!is_array($config)) {
            throw new RuntimeException('AquaCore OS configuration file must return an array.');
        }

        return $config;
    }

    /**
     * @return list<string>
     */
    private function localConfigFiles(string $configDirectory): array
    {
        $files = [];
        $defaultLocalConfig = $configDirectory . DIRECTORY_SEPARATOR . 'aquacore.local.php';

        if (is_file($defaultLocalConfig)) {
            $files[] = $defaultLocalConfig;
        }

        $environmentLocalConfig = getenv('AQUACORE_CONFIG_LOCAL');

        if ($environmentLocalConfig === false || trim($environmentLocalConfig) === '') {
            return $files;
        }

        $environmentLocalConfig = trim($environmentLocalConfig);

        if (!is_file($environmentLocalConfig)) {
            throw new RuntimeException('AQUACORE_CONFIG_LOCAL points to a missing configuration file.');
        }

        if (!in_array($environmentLocalConfig, $files, true)) {
            $files[] = $environmentLocalConfig;
        }

        return $files;
    }

    /**
     * @param array<string, mixed> $base
     * @param array<string, mixed> $override
     * @return array<string, mixed>
     */
    private function mergeConfig(array $base, array $override): array
    {
        foreach ($override as $key => $value) {
            if (is_array($value) && isset($base[$key]) && is_array($base[$key])) {
                $base[$key] = $this->mergeConfig($base[$key], $value);
                continue;
            }

            $base[$key] = $value;
        }

        return $base;
    }
}