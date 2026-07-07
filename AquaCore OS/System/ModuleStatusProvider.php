<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

use AquaCoreOS\Config\Configuration;

final class ModuleStatusProvider
{
    public function __construct(
        private readonly Configuration $configuration,
    ) {
    }

    /**
     * @return list<ModuleStatus>
     */
    public function all(): array
    {
        return [
            new ModuleStatus('Config', ModuleState::READY, 'Configuration is loaded.'),
            new ModuleStatus('Logging', ModuleState::READY, 'Local file logger is available.'),
            new ModuleStatus('System', ModuleState::READY, 'Core system commands are available.'),
            new ModuleStatus(
                'Database',
                $this->configuration->database()->configured() ? ModuleState::CONFIGURED : ModuleState::NOT_CONFIGURED,
                'MariaDB connection is not executed by diagnostics.',
            ),
            new ModuleStatus(
                'MQTT',
                $this->configuration->mqtt()->configured() ? ModuleState::CONFIGURED : ModuleState::NOT_CONFIGURED,
                'MQTT broker connection is not executed by diagnostics.',
            ),
            new ModuleStatus('API', ModuleState::PLANNED, 'Router exists, public endpoints are not registered yet.'),
            new ModuleStatus('Security', ModuleState::NOT_IMPLEMENTED, 'Authentication is not implemented yet.'),
        ];
    }
}
