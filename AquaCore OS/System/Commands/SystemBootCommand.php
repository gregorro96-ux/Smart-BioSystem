<?php

declare(strict_types=1);

namespace AquaCoreOS\System\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\BootSequence;

final class SystemBootCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly BootSequence $bootSequence,
    ) {
    }

    public function name(): string
    {
        return 'system:boot';
    }

    public function description(): string
    {
        return 'Runs the current AquaCore OS boot sequence.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" system:boot';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('System boot command executed.');

        foreach ($this->bootSequence->run() as $result) {
            echo sprintf(
                "%s: %s - %s%s",
                $result->name(),
                $result->isSuccessful() ? 'ok' : 'failed',
                $result->message(),
                PHP_EOL,
            );
        }

        return 0;
    }
}
