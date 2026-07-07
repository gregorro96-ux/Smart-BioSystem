<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

use AquaCoreOS\Config\Configuration;

final class SystemStatus
{
    public function __construct(
        private readonly Configuration $configuration,
    ) {
    }

    /**
     * Zwraca podstawowy status startowy systemu bez odpytywania bazy danych.
     */
    public function getStatus(): array
    {
        return [
            'project' => SystemConstants::PROJECT,
            'system' => SystemConstants::NAME,
            'version' => SystemConstants::VERSION,
            'architecture' => SystemConstants::ARCHITECTURE,
            'environment' => $this->configuration->environment()->value,
            'php' => PHP_VERSION,
            'status' => 'bootable',
        ];
    }
}
