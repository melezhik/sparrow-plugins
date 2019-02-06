# SYNOPSIS

Outthentic plugin.

Since there is no an official installer for Archlinux, user has to install it manually. Such project as [Archfi](https://github.com/MatMoul/archfi/blob/master/archfi), [AUI](https://github.com/helmuthdu/aui) are quite heavy and install OS in interactive mode, this script makes automatic installation according to your configuration.

Inspired by kickstart for RH-like OS.

There is video for installingb by the plugin - [click](https://www.youtube.com/watch?v=fEuBmVjCiCg&t=571s)

# INSTALL

    $ sparrow plg install archlinux-install

# USAGE

## via sparrow task    
    $ sparrow project create archlinux
    $ sparrow task add archlinux install archlinux-install

Add configuration in your config file (yaml, json or Config::General):

    $ sparrow task ini archlinux/install

    hostname: Arch-test
    rootpw: koteika42
    disk:
      lvm:
        vg: vg_main
        lv: slashroot
    bootloader:
      grub:
        install: true
        type: efi
        target: /dev/sda
        partition: /dev/sda2

    $ sparrow task run archlinux/install

## via sparrowdo

    $ cat sparrowfile
    task-run "Install Archlinux", "archlinux-install", %(
      hostname => 'Arch',
      locales => %(
        default => 'zh_SG.UTF-8 UTF-8'
      ),
      mirrorlist => %(
        servers => ( 'http://mirror.yandex.ru/archlinux/$repo/os/$arch' )
      ),
      disk => %(
        lvm  => %(
          vg   => 'vg_main',
          lv   => 'slashroot',
        ),
      ),
      bootloader => %(
        grub   => %(
          install   => 'true',
          type      => 'efi',
          target    => '/dev/sda',
          partition => '/dev/sda2',
        ),
      ),
      packages => %(
        installed  => ('openssh', 'sudo', 'networkmanager'),
      ),
      services => %(
        enabled => ('sshd', 'NetworkManager', 'dhcpcd'),
      )
    );

For more examples see here - [Archlinux sparrowfiles](https://github.com/Spigell/sparrow-sparrowdo-examples/tree/master/archlinux_scenarios)

# Parameters
### hostname
Name of host.

### rootpw
Your root password.

### timezone
TZ for host. Must be in format: *Zone/SubZone*.

See list in Wiki - https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

### locales
#### default
default locale for host. Generates locale and set LANG environment.

See supported in `/etc/locale.gen`.

### mirrorlist
#### servers
list of mirrors for downloading packages. Rewrites an old one in arhiso and will be copy to new system.

May increase speed of installation.

## disc part
All partitions and lvm volumes must be created and contains filesystem.
### partition
/dev/sdaX

### LVM
#### vg
Your volume group.

#### lv
Your logical volume.

## bootloader part
### GRUB
#### type
Supported types: 
 - efi
 - bios

#### target
Your phisical disk for installing grub.

#### partition
Your desired partition for install grub. For `efi` must be ESP type.
No need for `bios` installation.

Remember: for efi installation you must create fat32 parition with `boot` flag. For bios installation on gpt partition with `bios_grub` flags must be exists.

## packages
### installed
list of packages to install after installation. Separated by comma. 

## services
### enabled
list of services (systemd units) to enable. Separated by comma.

## mount
### table
list of partitions and mount points for generating /etc/fstab. Separated by comma.
Format:

    mount => %(
      table => (
        '/dev/mapper/vg_main-home:/home/',
        '/dev/mapper/vg_main-spigell:/home/spigell'
      )
    )
 


# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)
