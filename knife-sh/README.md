# SYNOPSIS

Outthentic plugin.

Sparrow wrapper for [knife-sh](https://github.com/vadv/knife-sh)

# INSTALL

    $ sparrow plg install knife-sh

# USAGE

## via Sparrowdo

    $ cat sparrowfile

    package-install 'go'; # we need golang for installation

    task_run 'install knife-sh', 'knife-sh', %(
      action => 'install',
      install_path => '/tmp'
    );

    task_run 'test run', 'knife-sh', %(
      action => 'run',
      command => 'uptime',
      hosts => '127.0.0.1 127.0.0.2',
      exec_file => '/tmp/knife-sh',
      ssh-user => 'test',
      identity-file => '/tmp/test.key',
      options => '-s --chef-client test',
    );

    task_run 'test run', 'knife-sh', %(
      action => 'copy',
      hosts => '127.0.0.1 127.0.0.2',
      debug => 'true',
      source => '/etc/hosts',
      destination => '~/hosts',
      ssh-user => 'test',
    );

Please see knife-sh help for more options

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)

[knife-sh](https://github.com/vadv/knife-sh)
