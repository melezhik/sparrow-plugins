set_spl (dev-knife-sh => 'https://github.com/Spigell/knife-sh');


package-install 'go';
task_run 'install knife-sh', 'dev-knife-sh', %(
  action => 'install',
  install_path => '/tmp'
);

bash 'ls -alht /tmp/knife-sh';

