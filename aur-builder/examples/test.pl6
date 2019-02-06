set_spl %( 'dev-aur-builder' => 'https://github.com/Spigell/aur-builder.git' );
task_run 'rakudo', 'rakudo-install';

task_run 'install zef', 'dev-aur-builder', %(
   list => ( 'zef' ),
   user => 'vagrant',
   debug => 'true',
   build_root => '/aur-build',
   install => 'true',
   output => '/tmp/chef'
);
