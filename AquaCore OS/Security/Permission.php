<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class Permission
{
    public const SYSTEM_STATUS_READ = 'system.status.read';
    public const API_HEALTH_READ = 'api.health.read';
    public const ECOSYSTEM_READ = 'ecosystem.read';
    public const ECOSYSTEM_CONTROL = 'ecosystem.control';
    public const SECURITY_CONTEXT_READ = 'security.context.read';
}