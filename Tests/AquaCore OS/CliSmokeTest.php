<?php

declare(strict_types=1);

$rootPath = dirname(__DIR__, 2);
$entrypoint = $rootPath . DIRECTORY_SEPARATOR . 'AquaCore OS' . DIRECTORY_SEPARATOR . 'aquacore.php';
$php = PHP_BINARY;

putenv('AQUACORE_DISABLE_LOCAL_CONFIG=1');

$tests = [
    [
        'name' => 'default command shows help',
        'command' => '',
        'expected' => ['AquaCore OS CLI', 'Available commands:', 'system:status'],
    ],
    [
        'name' => 'help command lists usage',
        'command' => 'help',
        'expected' => ['AquaCore OS CLI', 'usage:', 'config:validate'],
    ],
    [
        'name' => 'system status is bootable',
        'command' => 'system:status',
        'expected' => ['status: bootable', 'environment: development'],
    ],
    [
        'name' => 'system version shows version',
        'command' => 'system:version',
        'expected' => ['system: AquaCore OS', 'version: 0.1.0-dev'],
    ],
    [
        'name' => 'config show exposes environment',
        'command' => 'config:show',
        'expected' => ['environment: development', 'timezone: Europe/Warsaw', 'local_override_loaded: false'],
    ],
    [
        'name' => 'config validate passes',
        'command' => 'config:validate',
        'expected' => ['valid: true', 'message: configuration is valid'],
    ],
    [
        'name' => 'logs status sees writable directory',
        'command' => 'logs:status',
        'expected' => ['directory_exists: true', 'directory_write_probe: true'],
    ],
    [
        'name' => 'database status does not connect',
        'command' => 'database:status',
        'expected' => ['configured: false', 'connection_test: not executed'],
    ],
    [
        'name' => 'database test skips when not configured',
        'command' => 'database:test',
        'expected' => ['database_layer: ready', 'mariadb_connection: skipped', 'diagnostic_code: not_configured', 'schema_changes: none'],
    ],
    [
        'name' => 'mqtt status does not connect',
        'command' => 'mqtt:status',
        'expected' => ['configured: false', 'connection_test: not executed'],
    ],
    [
        'name' => 'system boot runs sequence',
        'command' => 'system:boot',
        'expected' => ['configuration: ok - Configuration loaded.'],
    ],
    [
        'name' => 'system modules lists core modules',
        'command' => 'system:modules',
        'expected' => ['Config: ready', 'Database: not_configured', 'Security: not_implemented'],
    ],
    [
        'name' => 'api status has no public endpoints',
        'command' => 'api:status',
        'expected' => ['module: API', 'public_endpoints: none'],
    ],
    [
        'name' => 'security status is anonymous',
        'command' => 'security:status',
        'expected' => ['authenticated: false', 'login: not implemented'],
    ],
];

$failures = 0;

foreach ($tests as $test) {
    $command = sprintf('"%s" "%s" %s 2>&1', $php, $entrypoint, $test['command']);
    $output = [];
    $exitCode = 0;

    exec($command, $output, $exitCode);
    $text = implode(PHP_EOL, $output);

    if ($exitCode !== 0) {
        echo sprintf("FAIL %s: exit code %d%s", $test['name'], $exitCode, PHP_EOL);
        echo $text . PHP_EOL;
        $failures++;
        continue;
    }

    foreach ($test['expected'] as $expected) {
        if (!str_contains($text, $expected)) {
            echo sprintf("FAIL %s: missing '%s'%s", $test['name'], $expected, PHP_EOL);
            echo $text . PHP_EOL;
            $failures++;
            continue 2;
        }
    }

    echo sprintf("OK %s%s", $test['name'], PHP_EOL);
}

if ($failures > 0) {
    echo sprintf("Failures: %d%s", $failures, PHP_EOL);
    exit(1);
}

echo 'All CLI tests passed.' . PHP_EOL;
