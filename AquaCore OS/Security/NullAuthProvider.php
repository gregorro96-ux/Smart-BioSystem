<?php

declare(strict_types=1);

namespace AquaCoreOS\Security;

final class NullAuthProvider implements AuthProviderInterface
{
    public function currentUser(): UserContext
    {
        return UserContext::anonymous();
    }
}
