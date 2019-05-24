# SYNOPSIS

Connects to remote server by ssh and checks if user gets listed in \`sudoers' group. 

This effectively means user has a sudo access on this server.

# INSTALL

    $ s6 --install ssh-sudo-check


# USAGE


/ssh-sudo-check/README
/ssh-sudo-check/README
    $ s6 --task-set cluster sudoers

    servers = 127.0.0.1,foo.bar.baz,192.168.0.0.1
    ssh_command = ssh -l foo -i ~/my_key.pem 

    users = foo,bar,superuser

    # this is the name of `sudoers' group
    # change this to something different to match your requirements
    # f.e. sudo_group = wheel
    sudo_group = sudo

    $ s6 --task-run cluster sudoers

# Setting parameters in runtime

    $ s6 --task-run cluster sudoers,servers=192.168.0.1,192.168.0.2\
    ,users=foo,bar,sudo_group=wheel
 
# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
