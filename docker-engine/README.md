# SYNOPSIS

Installs docker engine on Linux box

# INSTALL

    $ s6 --install docker-engine

# API

```raku
#!raku
  task-run "install", "docker-engine", %(
    :cli_only,
  );
```

Parameters:

* `cli_only`

Install docker cli only. Optional.

# Platforms supported

* Ubuntu

* Debian

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[https://docs.docker.com/engine/installation/linux/ubuntulinux](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
