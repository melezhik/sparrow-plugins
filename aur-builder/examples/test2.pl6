set_spl %( 'dev-aur-builder' => 'https://github.com/Spigell/aur-builder.git' );

task_run 'install some packages', 'dev-aur-builder', %(
   list => ( 'kubectl-bin', 'kubelet-bin' ),
   user => 'vagrant',
   debug => 'true',
   build_root => '/aur-build',
   install => 'true',
   output => '/tmp/chef'
);

