<?php

declare(strict_types=1);

namespace AquaCoreOS\Testing\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class TestsRunCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly string $rootPath,
    ) {
    }

    public function name(): string
    {
        return 'tests:run';
    }

    public function description(): string
    {
        return 'Runs AquaCore OS CLI smoke tests.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" tests:run';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Tests run command executed.');

        $testFile = dirname($this->rootPath) . DIRECTORY_SEPARATOR . 'Tests' . DIRECTORY_SEPARATOR . 'AquaCore OS' . DIRECTORY_SEPARATOR . 'CliSmokeTest.php';

        if (!is_file($testFile)) {
            echo 'tests: missing' . PHP_EOL;
            echo 'file: ' . $testFile . PHP_EOL;
            return 1;
        }

        $command = sprintf('"%s" "%s" 2>&1', PHP_BINARY, $testFile);
        $output = [];
        $exitCode = 0;

        exec($command, $output, $exitCode);

        foreach ($output as $line) {
            echo $line . PHP_EOL;
        }

        return $exitCode;
    }
}
