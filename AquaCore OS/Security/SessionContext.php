<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class SessionContext
{
    private function __construct(
        private readonly bool $active,
        private readonly ?string $sessionId,
    ) {
    }

    public static function none(): self
    {
        return new self(false, null);
    }

    public function active(): bool
    {
        return $this->active;
    }

    public function sessionId(): ?string
    {
        return $this->sessionId;
    }

    public function toArray(): array
    {
        return [
            'active' => $this->active,
            'session_id_present' => $this->sessionId !== null,
        ];
    }
}