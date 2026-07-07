<?php

declare(strict_types=1);

namespace AquaCoreOS\Core;

use AquaCoreOS\Logging\Logger;

final class Kernel
{
    public function __construct(
        private readonly Logger $logger,
        private readonly CommandRegistry $commands,
    ) {
    }

    public function handleCli(array $arguments): int
    {
        $command = $arguments[1] ?? 'help';
        $registeredCommand = $this->commands->get($command);

        if ($registeredCommand !== null) {
            return $registeredCommand->execute($arguments);
        }

        $this->logger->warning(sprintf('Unknown CLI command: %s', $command));

        fwrite(STDERR, sprintf("Unknown command: %s%s", $command, PHP_EOL));
        fwrite(STDERR, sprintf("Available commands:%s", PHP_EOL));

        foreach ($this->commands->all() as $registeredCommand) {
            fwrite(
                STDERR,
                sprintf("- %s: %s%s", $registeredCommand->name(), $registeredCommand->description(), PHP_EOL)
            );
        }

        return 1;
    }
}
