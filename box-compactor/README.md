# SYNOPSIS

Outthentic plugin.

Script for cleaning VM before put it in box (Vagrant)

# INSTALL

    $ sparrow plg install box-compactor

# USAGE

## via Sparrowdo
  $ cat sparrowfile

    task_run 'zero space', 'dev-box-compactor', %(
      clean_cache => 'false',
      zero_disk   => 'true',
    );


# Parameters

### clean_cache

Default is `true`

Supported os:
 - archlinux

### zero_disk

Default is `true`

# See also

[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)
