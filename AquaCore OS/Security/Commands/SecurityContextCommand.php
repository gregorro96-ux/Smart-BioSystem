<?php

declare(strict_types=1);

namespace AquaCoreOS\Security\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\Security\AuthProviderInterface;

final class SecurityContextCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly AuthProviderInterface $authProvider,
    ) {
    }

    public function name(): string
    {
        return 'security:context';
    }

    public function description(): string
    {
        return 'Shows current security context without logging in a user.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" security:context';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Security context command executed.');
        $context = $this->authProvider->currentUser();

        echo json_encode($context->toArray(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES) . PHP_EOL;

        return 0;
    }
}