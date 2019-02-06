# SYNOPSIS

Sparrow plugin. Supports only Virtualbox VMs.

Add user to Virtualbox's VM according with Vagrant user [guide](https://www.vagrantup.com/docs/boxes/base.html#quot-vagrant-quot-user) and repackage vbox into vagrant box.

# INSTALL

    $ sparrow plg install vagrant-vbox-importer

## Dependencies

### Optional

[sshpass](https://sourceforge.net/projects/sshpass) - for noninteractive password input 

# USAGE

## via yaml

    $ sparrow project create vagrant
    $ sparrow task add vagrant create vagrant-vbox-importer

Add configuration in your yaml file:

    $ sparrow task ini vagrant/create

    host:
      ip: 192.168.0.23
      port: 22
      user: root
      password: pass
  
    vagrant:
      user: vagrant
      password: vagrant
      public_key_file: /home/spigell/.ssh/keys/private/spigell.pub
      private_key_file: /home/spigell/.ssh/keys/private/spigell
  
    box:
      name: package.box
      base: centos-master-test-iso

    $ sparrow task run vagrant/create

# Parameters

## host section

### ip
ip of target. Obligatory.

### port
port. default is `22`.

### user
user with sudo rights or root of course. Default is `root`.

### password
passphrase for user. For usage you must install sshpass.


## vagrant section

### user
name of main vagrant user. Default is `vagrant`.

### password
pass for the user.  Default is `vagrant`.

### public_key_file
public key for the user.

### private_key_file
private key for the user. Uses it for checking.

## box section

### name
name of file after repackage.

### box
VM of Virtualbox. 
