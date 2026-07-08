<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class UserContext
{
    /**
     * @param list<string> $roles
     * @param list<string> $permissions
     */
    public function __construct(
        private readonly bool $authenticated,
        private readonly ?int $userId,
        private readonly array $roles,
        private readonly array $permissions,
        private readonly SessionContext $session,
    ) {
    }

    public static function anonymous(): self
    {
        return new self(
            false,
            null,
            [UserRole::ANONYMOUS],
            [Permission::SYSTEM_STATUS_READ, Permission::API_HEALTH_READ],
            SessionContext::none(),
        );
    }

    public function authenticated(): bool
    {
        return $this->authenticated;
    }

    public function userId(): ?int
    {
        return $this->userId;
    }

    /**
     * @return list<string>
     */
    public function roles(): array
    {
        return $this->roles;
    }

    /**
     * @return list<string>
     */
    public function permissions(): array
    {
        return $this->permissions;
    }

    public function session(): SessionContext
    {
        return $this->session;
    }

    public function hasPermission(string $permission): bool
    {
        return in_array($permission, $this->permissions, true);
    }

    public function toArray(): array
    {
        return [
            'authenticated' => $this->authenticated,
            'user_id_present' => $this->userId !== null,
            'roles' => $this->roles,
            'permissions' => $this->permissions,
            'session' => $this->session->toArray(),
        ];
    }
}