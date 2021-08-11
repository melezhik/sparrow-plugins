# SYNOPSIS

Check multiple hosts states over ssh.

# INSTALL

    $ s6 --install ssh-bulk-check

# USAGE

Raku:

    my %state = task-run "check my hosts", "ssh-bulk-check", %(

      cmd => "files/cmd.sh",
      state => "files/state.check",
      hosts => [ "foo", "bar", "baz" ],
      user => "admin",
      password => "qwerty123",

    );

    die "some checks failed" if %state<__data__><task-check-err-cnt>;

Check command:

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

# Localhost mode

To run in localhost mode - without ssh, set host to `localhost`:

    hosts => [ 'localhost' ]

# Examples

## Check size of a directory

cmd.sh

    echo "/tmp/ dir size"
      sudo du -sh /tmp/
    echo "end check"

state.check

    between: { '/tmp/ dir size' } { end \s+ check }
    
    regexp: ^^ \d+(\w+) \s+ '/tmp/'
    
    generator: <<HERE
    !perl
    
      if (@{matched()}){
        my $order = capture()->[0];
        print "assert: ", ( $order eq 'G' ? 0 : 1 ), " the size of /tmp dir is less then 1 GB\n";
      }
    
    HERE
    
    end:    

## Check that processes run 

cmd.sh

    echo "check if nginx is alive"
      ps uax| grep nginx| grep -v grep
    echo "end check"
    
state.check

    between: { 'check if nginx is alive' } { end \s+ check }
    
    /usr/sbin/nginx -g daemon on; master_process on;
    
    regexp: ^^ 'www-data' \s+ .* \s+ worker \s+ process $$
    
    generator: <<HERE
    !perl
    
      if (my $cnt = @{matched()}){
        print "assert: ", ( $cnt <= 2 ? 1 : 0  ), " no more 2 nginx worker launched\n";
      }
    
    HERE
    
    end:
    
# Requirements

* ssh

* sshpass

# Author

Alexey Melezhik
