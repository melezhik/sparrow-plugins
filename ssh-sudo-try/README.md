# SYNOPSIS

Connects to remote server by ssh and determines if a user has a sudo access for a command.

# INSTALL

    s6 --install ssh-sudo-try

# USAGE

Cli

    s6 --plg-run ssh-sudo-try@servers=23.100.124.15,23.100.124.16,23.100.124.17

Raku

    # check for the current user with default command
    task-run "ssh/sudo check", "ssh-sudo-try", %(
      servers => "23.100.124.15,23.100.124.16,23.100.124.17"
    );

    # check for the specific user with a specific command
    task-run "ssh/sudo check", "ssh-sudo-try", %(
      servers       => "23.100.124.15,23.100.124.16,23.100.124.17"
      ssh_command   => "sudo systemctl start nginx"
    );

    # use speficif ssh command
    task-run "ssh/sudo check", "ssh-sudo-try", %(
      servers       => "23.100.124.15,23.100.124.16,23.100.124.17"
      sudo_command   => "sudo systemctl start nginx"
      ssh_command => "ssh  -l support"
    );


# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
