<?php

declare(strict_types=1);

use AquaCoreOS\Core\Bootstrap;

require_once __DIR__ . DIRECTORY_SEPARATOR . 'Core' . DIRECTORY_SEPARATOR . 'Bootstrap.php';

$kernel = Bootstrap::boot(__DIR__);

exit($kernel->handleCli($argv));
