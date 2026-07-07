<?php

declare(strict_types=1);

return [
    'app_name' => 'AquaCore OS',
    'environment' => 'development',
    'timezone' => 'Europe/Warsaw',

    'database' => [
        'configured' => false,
        'driver' => 'mysql',
        'host' => 'localhost',
        'port' => 3306,
        'database' => 'sbs',
        'username' => 'aquacore',
    ],

    'mqtt' => [
        'configured' => false,
        'host' => 'localhost',
        'port' => 1883,
        'client_id' => 'aquacore-os',
        'base_topic' => 'mqtt/sbs',
    ],
];
