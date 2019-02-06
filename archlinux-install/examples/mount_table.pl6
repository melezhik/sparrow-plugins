set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "set root pass", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  mount => %(
    table => ( 
	  '/dev/mapper/vg_main-home:/home/', 
	  '/dev/mapper/vg_main-spigell:/home/spigell'
	)
  ),
);
