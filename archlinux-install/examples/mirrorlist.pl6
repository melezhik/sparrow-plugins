set_spl %( dev-archlinux-install => 'https://github.com/Spigell/archlinux-install' );

task-run "create mirrorlist", "dev-archlinux-install", %(
  main   => %( 
    install => 'false',
  ),
  mirrorlist => %(
    servers => ( 'http://mirror.yandex.ru/archlinux/$repo/os/$arch',
              'http://mirror.yandex.ru/archlinux/$repo/os/$arch'
		       )
  ),
  debug => 'true'
);
