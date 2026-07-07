<?php

declare(strict_types=1);

namespace AquaCoreOS\Logging;

final class Logger
{
    public function __construct(
        private readonly string $logFile
    ) {
    }

    public function debug(string $message): void
    {
        $this->write(LogLevel::DEBUG, $message);
    }

    public function info(string $message): void
    {
        $this->write(LogLevel::INFO, $message);
    }

    public function warning(string $message): void
    {
        $this->write(LogLevel::WARNING, $message);
    }

    public function error(string $message): void
    {
        $this->write(LogLevel::ERROR, $message);
    }

    public function critical(string $message): void
    {
        $this->write(LogLevel::CRITICAL, $message);
    }

    private function write(string $level, string $message): void
    {
        $directory = dirname($this->logFile);

        if (!is_dir($directory)) {
            mkdir($directory, 0775, true);
        }

        $entry = sprintf(
            "[%s] %s aquacore-os: %s%s",
            date('Y-m-d H:i:s'),
            $level,
            $message,
            PHP_EOL
        );

        file_put_contents($this->logFile, $entry, FILE_APPEND | LOCK_EX);
    }
}
