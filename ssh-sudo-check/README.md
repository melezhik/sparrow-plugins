# SYNOPSIS

Connects to remote server by ssh and checks if user gets listed in \`sudoers' group. 

This effectively means user has a sudo access on this server.

# INSTALL

    $ s6 --install ssh-sudo-check


# USAGE


    $ sparrow project create cluster
    $ sparrow task add cluster sudoers ssh-sudo-check
    $ sparrow task ini cluster sudoers

    servers = 127.0.0.1,foo.bar.baz,192.168.0.0.1
    ssh_command = ssh -l foo -i ~/my_key.pem 

    users = foo,bar,superuser

    # this is the name of `sudoers' group
    # change this to something different to match your requirements
    # f.e. sudo_group = wheel
    sudo_group = sudo

    $ sparrow task run cluster sudoers

# Setting parameters in runtime

    $ sparrow task run cluster sudoers --param servers=192.168.0.1,192.168.0.2 \
    --param users=foo,bar --param sudo_group=wheel
 
# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
