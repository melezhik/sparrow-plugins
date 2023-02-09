# SYNOPSIS

Installs docker engine on Linux box

# INSTALL

    $ s6 --install docker-engine

# API

```yaml
tasks:
  -
    name: install-docker
    plugin: docker-engine
    config:
      cli_only: true
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
