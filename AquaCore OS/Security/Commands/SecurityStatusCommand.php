<?php

declare(strict_types=1);

namespace AquaCoreOS\Security\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\Security\AuthProviderInterface;
use AquaCoreOS\System\ModuleState;

final class SecurityStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly AuthProviderInterface $authProvider,
    ) {
    }

    public function name(): string
    {
        return 'security:status';
    }

    public function description(): string
    {
        return 'Shows Security module status without authenticating users.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" security:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Security status command executed.');
        $user = $this->authProvider->currentUser();

        echo 'module: Security' . PHP_EOL;
        echo 'state: ' . ModuleState::NOT_IMPLEMENTED . PHP_EOL;
        echo 'authenticated: ' . ($user->authenticated() ? 'true' : 'false') . PHP_EOL;
        echo 'login: not implemented' . PHP_EOL;

        return 0;
    }
}
