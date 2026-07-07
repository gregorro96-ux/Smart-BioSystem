<?php

declare(strict_types=1);

namespace AquaCoreOS\System\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\SystemConstants;

final class SystemVersionCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
    ) {
    }

    public function name(): string
    {
        return 'system:version';
    }

    public function description(): string
    {
        return 'Shows AquaCore OS version information.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" system:version';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('System version command executed.');

        echo 'project: ' . SystemConstants::PROJECT . PHP_EOL;
        echo 'system: ' . SystemConstants::NAME . PHP_EOL;
        echo 'version: ' . SystemConstants::VERSION . PHP_EOL;
        echo 'architecture: ' . SystemConstants::ARCHITECTURE . PHP_EOL;

        return 0;
    }
}
