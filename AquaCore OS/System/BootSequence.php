<?php

declare(strict_types=1);

namespace AquaCoreOS\System;

final class BootSequence
{
    /**
     * @param list<BootStepInterface> $steps
     */
    public function __construct(
        private readonly array $steps,
    ) {
    }

    /**
     * @return list<BootStepResult>
     */
    public function run(): array
    {
        $results = [];

        foreach ($this->steps as $step) {
            $results[] = $step->run();
        }

        return $results;
    }
}
