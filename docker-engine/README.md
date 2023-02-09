# SYNOPSIS

Installs docker engine on Linux box

# Platforms supported

* Ubuntu

* Debian

# INSTALL

    $ s6 --install docker-engine

# API

```yaml
task: install-docker
plugin: docker-engine
config:
  cli_only: true
```

Parameters:

* `cli_only`

Install docker cli only. Optional.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[https://docs.docker.com/engine/installation/linux/ubuntulinux](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
