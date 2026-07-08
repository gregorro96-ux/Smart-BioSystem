<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

final class DatabaseTestResult
{
    private function __construct(
        private readonly bool $successful,
        private readonly string $status,
        private readonly string $message,
    ) {
    }

    public static function success(string $message): self
    {
        return new self(true, 'connected', $message);
    }

    public static function skipped(string $message): self
    {
        return new self(true, 'skipped', $message);
    }

    public static function failure(string $message): self
    {
        return new self(false, 'failed', $message);
    }

    public function successful(): bool
    {
        return $this->successful;
    }

    public function status(): string
    {
        return $this->status;
    }

    public function message(): string
    {
        return $this->message;
    }
}
