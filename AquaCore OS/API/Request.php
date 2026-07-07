<?php

declare(strict_types=1);

namespace AquaCoreOS\API;

final class Request
{
    public function __construct(
        private readonly string $method,
        private readonly string $path,
    ) {
    }

    public function method(): string
    {
        return $this->method;
    }

    public function path(): string
    {
        return $this->path;
    }
}
