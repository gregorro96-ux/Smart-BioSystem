<?php

declare(strict_types=1);

namespace AquaCoreOS\API;

final class Router
{
    public function dispatch(Request $request): Response
    {
        return new Response(
            404,
            ApiResponse::failure(
                'api.route_not_found',
                'No public API routes are registered yet.',
                [
                    'method' => $request->method(),
                    'path' => $request->path(),
                ],
            ),
        );
    }
}
