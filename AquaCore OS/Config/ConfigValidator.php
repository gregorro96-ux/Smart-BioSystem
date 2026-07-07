<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

final class ConfigValidator
{
    public function validate(Configuration $configuration): ConfigValidationResult
    {
        $messages = [];

        if ($configuration->appName() === '') {
            $messages[] = 'app_name is empty';
        }

        if (!in_array($configuration->timezone(), timezone_identifiers_list(), true)) {
            $messages[] = 'timezone is invalid';
        }

        $database = $configuration->database()->toArray();
        if ((int) $database['port'] <= 0) {
            $messages[] = 'database.port is invalid';
        }

        if ($database['host'] === '') {
            $messages[] = 'database.host is empty';
        }

        $mqtt = $configuration->mqtt()->toArray();
        if ((int) $mqtt['port'] <= 0) {
            $messages[] = 'mqtt.port is invalid';
        }

        if ($mqtt['host'] === '') {
            $messages[] = 'mqtt.host is empty';
        }

        if ($mqtt['base_topic'] === '') {
            $messages[] = 'mqtt.base_topic is empty';
        }

        if ($messages === []) {
            $messages[] = 'configuration is valid';
        }

        return new ConfigValidationResult($messages === ['configuration is valid'], $messages);
    }
}
