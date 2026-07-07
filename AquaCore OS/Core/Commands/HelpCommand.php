<?php

declare(strict_types=1);

namespace AquaCoreOS\Core\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Core\CommandRegistry;
use AquaCoreOS\Logging\Logger;

final class HelpCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly CommandRegistry $commands,
    ) {
    }

    public function name(): string
    {
        return 'help';
    }

    public function description(): string
    {
        return 'Shows available AquaCore OS CLI commands.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" help';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Help command executed.');

        echo 'AquaCore OS CLI' . PHP_EOL;
        echo 'Available commands:' . PHP_EOL;

        foreach ($this->commands->all() as $command) {
            echo sprintf('- %s: %s%s', $command->name(), $command->description(), PHP_EOL);
            echo sprintf('  usage: %s%s', $command->usage(), PHP_EOL);
        }

        return 0;
    }
}
