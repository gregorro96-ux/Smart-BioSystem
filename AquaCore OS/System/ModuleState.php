<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

final class ModuleState
{
    public const READY = 'ready';
    public const CONFIGURED = 'configured';
    public const NOT_CONFIGURED = 'not_configured';
    public const NOT_IMPLEMENTED = 'not_implemented';
    public const PLANNED = 'planned';
}
