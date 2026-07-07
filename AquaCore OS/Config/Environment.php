<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

enum Environment: string
{
    case Local = 'local';
    case Development = 'development';
    case Beta = 'beta';
    case Stable = 'stable';

    public function debugEnabled(): bool
    {
        return match ($this) {
            self::Local, self::Development => true,
            self::Beta, self::Stable => false,
        };
    }

    public function logLevel(): string
    {
        return match ($this) {
            self::Local => 'debug',
            self::Development => 'info',
            self::Beta => 'warning',
            self::Stable => 'error',
        };
    }
}
