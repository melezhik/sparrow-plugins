set_spl %( dev-gogs-dockerized-backuper => 'https://github.com/Spigell/gogs-backuper' );

task-run "test", "dev-gogs-dockerized-backuper", %(
  docker => %(
	name => 'gogs_gogs_1'
  ),
  destination => '/home/vagrant/backup'
);
