<?php

declare(strict_types=1);

namespace AquaCoreOS\API;

final class Response
{
    public function __construct(
        private readonly int $statusCode,
        private readonly ApiResponse $payload,
    ) {
    }

    public function statusCode(): int
    {
        return $this->statusCode;
    }

    public function payload(): array
    {
        return $this->payload->toArray();
    }
}
