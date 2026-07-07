<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

final class ModuleStatus
{
    public function __construct(
        private readonly string $name,
        private readonly string $state,
        private readonly string $message,
    ) {
    }

    public function name(): string
    {
        return $this->name;
    }

    public function state(): string
    {
        return $this->state;
    }

    public function message(): string
    {
        return $this->message;
    }

    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'state' => $this->state,
            'message' => $this->message,
        ];
    }
}
