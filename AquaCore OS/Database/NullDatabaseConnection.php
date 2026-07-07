<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

final class NullDatabaseConnection implements DatabaseConnectionInterface
{
    public function isConfigured(): bool
    {
        return false;
    }

    public function name(): string
    {
        return 'not configured';
    }
}
