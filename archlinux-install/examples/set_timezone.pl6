set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "set hostname", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  timezone => 'Atlantic/Madeira';
);
