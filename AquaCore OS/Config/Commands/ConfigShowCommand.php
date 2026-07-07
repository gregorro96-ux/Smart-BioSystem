<?php

declare(strict_types=1);

namespace AquaCoreOS\Config\Commands;

use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class ConfigShowCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
    ) {
    }

    public function name(): string
    {
        return 'config:show';
    }

    public function description(): string
    {
        return 'Shows loaded AquaCore OS configuration.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" config:show';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Config show command executed.');

        foreach ($this->configuration->toArray() as $key => $value) {
            echo sprintf("%s: %s%s", $key, $value, PHP_EOL);
        }

        return 0;
    }
}
