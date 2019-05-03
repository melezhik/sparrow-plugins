set_spl %( 'dev-rakudo-install' => 'https://github.com/melezhik/rakudo-install' );

task_run 'install test Rakudo', 'dev-rakudo-install';
