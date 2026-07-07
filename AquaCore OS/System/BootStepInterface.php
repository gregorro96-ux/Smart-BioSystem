<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

interface BootStepInterface
{
    public function name(): string;

    public function run(): BootStepResult;
}
