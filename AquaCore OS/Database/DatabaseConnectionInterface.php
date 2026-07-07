<?php

declare(strict_types=1);

namespace AquaCoreOS\Database;

interface DatabaseConnectionInterface
{
    public function isConfigured(): bool;

    public function name(): string;
}
