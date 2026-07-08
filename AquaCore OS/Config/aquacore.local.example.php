<?php

declare(strict_types=1);

return [
    'environment' => 'development',

    'database' => [
        'configured' => false,
        'host' => 'example.local',
        'port' => 3306,
        'database' => 'sbs_example',
        'username' => 'example_user',
        'password' => 'CHANGE_ME',
    ],

    'mqtt' => [
        'configured' => false,
        'host' => 'example.local',
        'port' => 1883,
        'client_id' => 'aquacore-os-local-example',
        'base_topic' => 'mqtt/sbs/example',
    ],
];
