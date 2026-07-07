<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

final class BootStepResult
{
    private function __construct(
        private readonly string $name,
        private readonly bool $successful,
        private readonly string $message,
    ) {
    }

    public static function success(string $name, string $message): self
    {
        return new self($name, true, $message);
    }

    public function name(): string
    {
        return $this->name;
    }

    public function isSuccessful(): bool
    {
        return $this->successful;
    }

    public function message(): string
    {
        return $this->message;
    }
}
