<?php

declare(strict_types=1);

namespace AquaCoreOS\Logging\Commands;

use AquaCoreOS\Core\CommandInterface;
use AquaCoreOS\Logging\Logger;

final class LogsStatusCommand implements CommandInterface
{
    public function __construct(
        private readonly Logger $logger,
        private readonly string $logFile,
    ) {
    }

    public function name(): string
    {
        return 'logs:status';
    }

    public function description(): string
    {
        return 'Checks AquaCore OS log path availability.';
    }

    public function usage(): string
    {
        return 'php "AquaCore OS\\aquacore.php" logs:status';
    }

    public function execute(array $arguments): int
    {
        $this->logger->info('Logs status command executed.');

        $directory = dirname($this->logFile);
        $directoryExists = is_dir($directory);
        $directoryWriteProbe = $this->canWriteDirectory($directory);
        $fileExists = is_file($this->logFile);
        $fileWriteProbe = $this->canWriteLogFile();

        echo 'log_directory: ' . $directory . PHP_EOL;
        echo 'directory_exists: ' . ($directoryExists ? 'true' : 'false') . PHP_EOL;
        echo 'directory_write_probe: ' . ($directoryWriteProbe ? 'true' : 'false') . PHP_EOL;
        echo 'log_file: ' . $this->logFile . PHP_EOL;
        echo 'file_exists: ' . ($fileExists ? 'true' : 'false') . PHP_EOL;
        echo 'file_write_probe: ' . ($fileWriteProbe ? 'true' : 'false') . PHP_EOL;

        return $directoryExists && $directoryWriteProbe && $fileWriteProbe ? 0 : 1;
    }

    private function canWriteDirectory(string $directory): bool
    {
        if (!is_dir($directory)) {
            return false;
        }

        $probeFile = $directory . DIRECTORY_SEPARATOR . '.aquacore-write-test.tmp';
        $written = @file_put_contents($probeFile, 'ok', LOCK_EX);

        if ($written === false) {
            return false;
        }

        @unlink($probeFile);

        return true;
    }

    private function canWriteLogFile(): bool
    {
        $written = @file_put_contents($this->logFile, '', FILE_APPEND | LOCK_EX);

        return $written !== false;
    }
}
