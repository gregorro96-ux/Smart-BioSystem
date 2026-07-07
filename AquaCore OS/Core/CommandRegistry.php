<?php

declare(strict_types=1);

namespace AquaCoreOS\Core;

final class CommandRegistry
{
    /**
     * @var array<string, CommandInterface>
     */
    private array $commands = [];

    public function register(CommandInterface $command): void
    {
        $this->commands[$command->name()] = $command;
    }

    public function get(string $name): ?CommandInterface
    {
        return $this->commands[$name] ?? null;
    }

    /**
     * @return array<string, CommandInterface>
     */
    public function all(): array
    {
        ksort($this->commands);

        return $this->commands;
    }
}
