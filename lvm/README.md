# SYNOPSIS

Outthentic plugin.

Manage your logical volume and volume group via sparrow/sparrowdo.

# INSTALL

    $ sparrow plg install lvm

# USAGE

## manually

    $ sparrow plg run lvm --param partition=/dev/sda1 --param size=7G --param vg=vg_main --param lv=slashroot

## via Sparrowdo

    $ cat sparrowfile

    task-run "create main lv", "lvm", %(
      action    => 'create',
      recreate  => 'true',
      partition => '/dev/sda1',
      vg        => 'vg_main',
      lv        => 'slashroot',
      size      => '7GB'
    );
 
    task-run "remove main lv", "lvm", %(
      action  => 'remove',
      vg      => 'vg_main',
      lv      => 'slashroot',
      force   => 'true'
    );

# Parameters

## action
one of three: (create|remove|resize). Default is `create`. Required.

## vg
Your desired vg. Required.

## lv
Your desired lv. Required.

## Create action
## partition
Your partiton on disk. Required.

## size
Size of lvm. Required.

## recreate
flag for create a new logical volume if it's already created. Destroys an old. 
Optional.

## Resize action
You should select one directive for size: (size|add|reduce).

### size
New size for logical volume.

### add
Add some space for a logical volume.

### reduce
Reduce some space for a logical volume.

## Remove action
### force
A flag for forced operation. Unmount a mountpoint and destroy an old logical volume. Optional.

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)

[lvm docs on redhat site](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html-single/Logical_Volume_Manager_Administration/index.html)
