set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "Install packages", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
    packages => %(
	installed => ( 'openssh', 'sudo', 'networkmanager' )
  ),
  debug => 'true'
);
