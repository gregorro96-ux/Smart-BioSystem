<?php

declare(strict_types=1);

namespace AquaCoreOS\Core;

use AquaCoreOS\API\Commands\ApiStatusCommand;
use AquaCoreOS\Compatibility\Commands\MqttStatusCommand;
use AquaCoreOS\Compatibility\Commands\MqttTestCommand;
use AquaCoreOS\Config\Commands\ConfigShowCommand;
use AquaCoreOS\Config\Commands\ConfigValidateCommand;
use AquaCoreOS\Config\ConfigLoader;
use AquaCoreOS\Config\ConfigValidator;
use AquaCoreOS\Core\Commands\HelpCommand;
use AquaCoreOS\Database\Commands\DatabaseStatusCommand;
use AquaCoreOS\Database\Commands\DatabaseTestCommand;
use AquaCoreOS\Logging\Commands\LogsStatusCommand;
use AquaCoreOS\Logging\Logger;
use AquaCoreOS\Security\Commands\SecurityStatusCommand;
use AquaCoreOS\Security\NullAuthProvider;
use AquaCoreOS\System\BootSequence;
use AquaCoreOS\System\Commands\SystemBootCommand;
use AquaCoreOS\System\Commands\SystemHealthCommand;
use AquaCoreOS\System\Commands\SystemModulesCommand;
use AquaCoreOS\System\Commands\SystemStatusCommand;
use AquaCoreOS\System\Commands\SystemVersionCommand;
use AquaCoreOS\System\ConfigurationBootStep;
use AquaCoreOS\System\ModuleStatusProvider;
use AquaCoreOS\System\SystemStatus;
use AquaCoreOS\Testing\Commands\TestsRunCommand;

final class Bootstrap
{
    public static function boot(string $rootPath): Kernel
    {
        self::registerAutoloader($rootPath);

        $configuration = (new ConfigLoader())->load($rootPath);
        date_default_timezone_set($configuration->timezone());

        $logFile = dirname($rootPath) . DIRECTORY_SEPARATOR . 'Logs' . DIRECTORY_SEPARATOR . 'aquacore-os.log';
        $logger = new Logger($logFile);
        $systemStatus = new SystemStatus($configuration);
        $moduleStatusProvider = new ModuleStatusProvider($configuration);
        $bootSequence = new BootSequence([
            new ConfigurationBootStep(),
        ]);
        $authProvider = new NullAuthProvider();
        $commands = new CommandRegistry();

        $commands->register(new HelpCommand($logger, $commands));
        $commands->register(new SystemStatusCommand($logger, $systemStatus));
        $commands->register(new SystemHealthCommand($logger));
        $commands->register(new SystemBootCommand($logger, $bootSequence));
        $commands->register(new SystemModulesCommand($logger, $moduleStatusProvider));
        $commands->register(new SystemVersionCommand($logger));
        $commands->register(new ConfigShowCommand($logger, $configuration));
        $commands->register(new ConfigValidateCommand($logger, $configuration, new ConfigValidator()));
        $commands->register(new DatabaseTestCommand($logger));
        $commands->register(new DatabaseStatusCommand($logger, $configuration));
        $commands->register(new MqttTestCommand($logger));
        $commands->register(new MqttStatusCommand($logger, $configuration));
        $commands->register(new ApiStatusCommand($logger));
        $commands->register(new SecurityStatusCommand($logger, $authProvider));
        $commands->register(new LogsStatusCommand($logger, $logFile));
        $commands->register(new TestsRunCommand($logger, $rootPath));

        return new Kernel(
            $logger,
            $commands,
        );
    }

    private static function registerAutoloader(string $rootPath): void
    {
        spl_autoload_register(static function (string $class) use ($rootPath): void {
            $prefix = 'AquaCoreOS\\';

            if (!str_starts_with($class, $prefix)) {
                return;
            }

            $relativeClass = substr($class, strlen($prefix));
            $file = $rootPath . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $relativeClass) . '.php';

            if (is_file($file)) {
                require_once $file;
            }
        });
    }
}
