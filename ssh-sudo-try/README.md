# SYNOPSIS

Connects to remote server by ssh and determines if user has sudo access for the command.

# INSTALL

sparrow plg install ssh-sudo-try


# USAGE


Tomtit/Sparrowdo

    # check for the current user
    task-run "ssh/sudo check", "ssh-sudo-try", %(
      servers => "23.100.124.15,23.100.124.16,23.100.124.17"
    );

    # check for specific current user
    task-run "ssh/sudo check", "ssh-sudo-try", %(
      servers       => "23.100.124.15,23.100.124.16,23.100.124.17"
      ssh_command   => "ssh -l foo -tt"
    );


Sparrow cli:


    $ sparrow project create cluster
    $ sparrow task add cluster sudoers ssh-sudo-try
    $ sparrow task ini cluster sudoers 

      servers = 127.0.0.1,foo.bar.baz,192.168.0.0.1
  
      ssh_command = ssh -l foo -i ~/my_key.pem 

      sudo_command = sudo /bin/bash -c 'echo'

    $ sparrow task run cluster sudoers

Setting parameters on runtime:

    $ sparrow check run cluster sudoers \
    --param servers=192.168.0.1,192.168.0.2 \
    --param sudo_command='"sudo /etc/init.d/nginx restart'"
 
# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
