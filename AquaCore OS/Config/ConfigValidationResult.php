<?php

declare(strict_types=1);

namespace AquaCoreOS\Config;

final class ConfigValidationResult
{
    public function __construct(
        private readonly bool $valid,
        private readonly array $messages,
    ) {
    }

    public function valid(): bool
    {
        return $this->valid;
    }

    public function messages(): array
    {
        return $this->messages;
    }
}
