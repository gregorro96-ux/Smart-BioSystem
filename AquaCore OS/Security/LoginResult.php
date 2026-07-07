<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class LoginResult
{
    private function __construct(
        private readonly bool $success,
        private readonly string $message,
    ) {
    }

    public static function notImplemented(): self
    {
        return new self(false, 'Login is not implemented yet.');
    }

    public function success(): bool
    {
        return $this->success;
    }

    public function message(): string
    {
        return $this->message;
    }
}
