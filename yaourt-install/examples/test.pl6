set_spl %( 'dev-yaourt-install' => 'https://github.com/Spigell/yaourt-install.git' );

task_run 'install yaourt', 'dev-yaourt-install';
