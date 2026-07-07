<?php

declare(strict_types=1);

namespace AquaCoreOS\Core;

interface CommandInterface
{
    public function name(): string;

    public function description(): string;

    public function usage(): string;

    public function execute(array $arguments): int;
}
