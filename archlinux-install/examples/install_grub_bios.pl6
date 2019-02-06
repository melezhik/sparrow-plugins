set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "Install grub", "dev-archlinux-install", %(
  main   => %( 
    install  => 'false',
  ),
  bootloader => %(
    grub  => %( 
      type    => 'bios',
      target  => '/dev/sda',
	),
  ),
);
