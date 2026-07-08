<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

final class DatabaseTestResult
{
    private function __construct(
        private readonly bool $successful,
        private readonly string $status,
        private readonly string $message,
        private readonly string $diagnosticCode,
    ) {
    }

    public static function success(string $message): self
    {
        return new self(true, 'connected', $message, 'none');
    }

    public static function skipped(string $message): self
    {
        return new self(true, 'skipped', $message, 'not_configured');
    }

    public static function failure(string $message, string $diagnosticCode = 'unknown_failure'): self
    {
        return new self(false, 'failed', $message, $diagnosticCode);
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

    public function diagnosticCode(): string
    {
        return $this->diagnosticCode;
    }
}
