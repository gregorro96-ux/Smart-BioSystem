<?php

declare(strict_types=1);

namespace AquaCoreOS\API\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\System\ModuleState;

final class ApiStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
    ) {
    }

    public function name(): string
    {
        return 'api:status';
    }

    public function description(): string
    {
        return 'Shows API module status without exposing public endpoints.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" api:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('API status command executed.');

        echo 'module: API' . PHP_EOL;
        echo 'state: ' . ModuleState::PLANNED . PHP_EOL;
        echo 'router: ready' . PHP_EOL;
        echo 'public_endpoints: none' . PHP_EOL;
        echo 'private_health_payload: available' . PHP_EOL;
        echo 'http_server: not_started' . PHP_EOL;

        return 0;
    }
}
