<?php

declare(strict_types=1);

namespace AquaCoreOS\Errors;

final class ErrorCode
{
    public const SYSTEM_BOOT_FAILED = 'system.boot_failed';
    public const CONFIG_INVALID = 'config.invalid';
    public const DATABASE_NOT_CONFIGURED = 'database.not_configured';
    public const MQTT_NOT_CONFIGURED = 'mqtt.not_configured';
    public const API_ROUTE_NOT_FOUND = 'api.route_not_found';
    public const SECURITY_NOT_IMPLEMENTED = 'security.not_implemented';
}
