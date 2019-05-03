# SYNOPSIS

Installs docker engine on your linux box

# Platforms supported

* Ubuntu Trusty 14.04 (LTS)
* Debian 8.0 Jessie 

Please create an [issue](https://github.com/melezhik/docker-engine/issues)  if you need more platforms to support!

# INSTALL

    $ s6 --install docker-engine

# RUN

This command will install docker engine on your server:

    $ sparrow plg run docker-engine

# Runtime parameters

If you run a second time it could be handy to save your time asking a plugin to skip some time consuming steps.
For example skip `apt-get update` command and do not import gpg key:

    $ sparrow plg run docker-engine --param repo_update=0 --param add_gpg_key=0

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See also

[https://docs.docker.com/engine/installation/linux/ubuntulinux](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
