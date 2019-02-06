set_spl (dev-knife-sh => 'https://github.com/Spigell/knife-sh');


task_run 'test run', 'dev-knife-sh', %(
  action => 'copy',
  hosts => '127.0.0.1 127.0.0.2',
  debug => 'true',
  source => '/etc/hosts',
  destination => '~/hosts',
  ssh-user => 'test',
  ignore_errors => 'true'
);
