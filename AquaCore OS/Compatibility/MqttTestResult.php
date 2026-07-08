<?php

declare(strict_types=1);

namespace AquaCoreOS\Compatibility;

final class MqttTestResult
{
    private function __construct(
        private readonly bool $successful,
        private readonly string $status,
        private readonly string $diagnosticCode,
        private readonly string $message,
        private readonly string $publishOperation,
        private readonly string $subscribeOperation,
    ) {
    }

    public static function success(string $message): self
    {
        return new self(true, 'connected', 'none', $message, 'not_executed', 'not_executed');
    }

    public static function skipped(string $message): self
    {
        return new self(true, 'skipped', 'not_configured', $message, 'not_executed', 'not_executed');
    }

    public static function failure(string $diagnosticCode, string $message): self
    {
        return new self(false, 'failed', $diagnosticCode, $message, 'not_executed', 'not_executed');
    }

    public function successful(): bool
    {
        return $this->successful;
    }

    public function status(): string
    {
        return $this->status;
    }

    public function diagnosticCode(): string
    {
        return $this->diagnosticCode;
    }

    public function message(): string
    {
        return $this->message;
    }

    public function publishOperation(): string
    {
        return $this->publishOperation;
    }

    public function subscribeOperation(): string
    {
        return $this->subscribeOperation;
    }
}