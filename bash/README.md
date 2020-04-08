# SYNOPSIS

Execute bash commands

# INSTALL

    $ s6 --install bash

# USAGE

## Manually

    $ s6 --plg-run bash@user=foo,command="'echo hello world'"


## With sparrowdo

    $ cat sparrowfile

    task-run "server uptime", "bash", %(
      user      => 'root',
      command   => 'uptime',
      debug     => 1,
    );


# Parameters

## user

A user to execute a command. No default value. Optional.

## command

A command to be executed. No default value. Obligatory.

## expect_stdout

This is optional parameter. Verify if command print something into stdout. This should be Perl5 regex string.

Example:

    $ s6 --plg-run,command="echo I AM OK",expect_stdout='I AM \S+'

Or via API:

    task-run "server uptime", "bash", %(
      command   => 'uptime',
      debug     => 0,
      expect_stdout => '\d\d:\d\d:\d\d'
    );
    

## debug

Set bash debug mode on. Default value is `0` ( do not set ).

## passing environment variables

Use envvars parameter. For example:

    task-run "http GET request", "bash", %(
      command   => 'curl https://sparrowhub.org',
      envvars   => %(
        http_proxy  => "http://gateway.prx:3128",
        https_proxy => "https://gateway.prx:3128",
      )
    );

# cwd

Change to `cwd` directory priorly

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

