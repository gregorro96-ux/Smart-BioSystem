<?php

declare(strict_types=1);

namespace AquaCoreOS\System\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\ModuleStatusProvider;

final class SystemModulesCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly ModuleStatusProvider $modules,
    ) {
    }

    public function name(): string
    {
        return 'system:modules';
    }

    public function description(): string
    {
        return 'Shows diagnostic status of AquaCore OS modules.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" system:modules';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('System modules command executed.');

        foreach ($this->modules->all() as $module) {
            echo sprintf(
                "%s: %s - %s%s",
                $module->name(),
                $module->state(),
                $module->message(),
                PHP_EOL,
            );
        }

        return 0;
    }
}
