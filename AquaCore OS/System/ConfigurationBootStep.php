<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

final class ConfigurationBootStep implements BootStepInterface
{
    public function name(): string
    {
        return 'configuration';
    }

    public function run(): BootStepResult
    {
        return BootStepResult::success($this->name(), 'Configuration loaded.');
    }
}
