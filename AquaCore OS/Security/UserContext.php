<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class UserContext
{
    public function __construct(
        private readonly bool $authenticated,
        private readonly ?int $userId,
        private readonly array $roles,
    ) {
    }

    public static function anonymous(): self
    {
        return new self(false, null, []);
    }

    public function authenticated(): bool
    {
        return $this->authenticated;
    }

    public function userId(): ?int
    {
        return $this->userId;
    }

    public function roles(): array
    {
        return $this->roles;
    }
}
