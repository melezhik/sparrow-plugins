set_spl (dev-knife-sh => 'https://github.com/Spigell/knife-sh');


task_run 'test run', 'dev-knife-sh', %(
  action => 'run',
  command => 'uptime',
  hosts => '127.0.0.1 127.0.0.2',
  debug => 'true',
  exec_file => '/tmp/knife-sh',
  ssh-user => 'test',
  identity-file => '/tmp/test.key',
  options => '-s --chef-client test',
);


