<?php

declare(strict_types=1);

namespace AquaCoreOS\Config\Commands;

use AquaCoreOS\Config\Configuration;
use AquaCoreOS\Config\ConfigValidator;
use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class ConfigValidateCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly Configuration $configuration,
        private readonly ConfigValidator $validator,
    ) {
    }

    public function name(): string
    {
        return 'config:validate';
    }

    public function description(): string
    {
        return 'Validates AquaCore OS configuration without external connections.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" config:validate';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Config validate command executed.');
        $result = $this->validator->validate($this->configuration);

        echo 'valid: ' . ($result->valid() ? 'true' : 'false') . PHP_EOL;

        foreach ($result->messages() as $message) {
            echo 'message: ' . $message . PHP_EOL;
        }

        return $result->valid() ? 0 : 1;
    }
}
