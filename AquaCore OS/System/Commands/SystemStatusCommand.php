<?php

declare(strict_types=1);

namespace AquaCoreOS\System\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\SystemStatus;

final class SystemStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly SystemStatus $systemStatus,
    ) {
    }

    public function name(): string
    {
        return 'system:status';
    }

    public function description(): string
    {
        return 'Shows basic AquaCore OS status.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" system:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('System status command executed.');

        foreach ($this->systemStatus->getStatus() as $key => $value) {
            echo sprintf("%s: %s%s", $key, $value, PHP_EOL);
        }

        return 0;
    }
}
