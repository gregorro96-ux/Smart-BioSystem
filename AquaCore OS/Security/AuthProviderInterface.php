<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

interface AuthProviderInterface
{
    public function currentUser(): UserContext;
}
