<?php

declare(strict_types=1);

namespace AquaCoreOS\API;

final class ApiResponse
{
    private function __construct(
        private readonly bool $success,
        private readonly string $code,
        private readonly string $message,
        private readonly array $data = [],
        private readonly array $errors = [],
    ) {
    }

    public static function success(string $code, string $message, array $data = []): self
    {
        return new self(true, $code, $message, $data);
    }

    public static function failure(string $code, string $message, array $errors = []): self
    {
        return new self(false, $code, $message, [], $errors);
    }

    public function toArray(): array
    {
        return [
            'success' => $this->success,
            'code' => $this->code,
            'message' => $this->message,
            'data' => $this->data,
            'errors' => $this->errors,
        ];
    }
}
