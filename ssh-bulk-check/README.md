# SYNOPSIS

Check multiple hosts states over ssh.

# INSTALL

    $ sparrow plg install ssh-bulk-check

# USAGE

    task-run "check my hosts", "ssh-bulk-check", %(

      cmd => "files/cmd.sh",
      state => "files/state.check",
      hosts => [ "foo", "bar", "baz" ],
      user => "admin",
      password => "qwerty123",

    );


    cat files/check.sh

    ls -l /var/data && echo '/var/data/' exists
    ls -d /var/data && echo '/var/data/' is a directory
    ps uax| grep web && echo "process web runs"
    id foo && echo "user foo exists"


    cat files/state.check

    /var/data exists
    /var/data is a directory
    process web runs
    user foo exists


    # passwordless variant

    task-run "check my hosts", "ssh-bulk-check", %(

      cmd => "files/cmd.sh",
      state => "files/state.check",
      hosts => [ "foo", "bar", "baz" ],

    );

# Parameters

* `cmd`

File with shell commands to run on ssh hosts

* `state`

File with check rules for `cmd` output, should be in [Sparrow6 Task Check](https://github.com/melezhik/Sparrow6/blob/master/documentation/taskchecks.md) format

*  `hosts`

List of ssh hosts, could be fqdns or IP addresses


* `user`

Ssh user

* `password`

Ssh password


# Requirements

* ssh

* sshpass

# Author

Alexey Melezhik

