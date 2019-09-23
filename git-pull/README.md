# SYNOPSIS

Make git pull for current local branch

# INSTALL

    $ s6 --install git-pull

# USAGE

Tomtit scenario:

    $ cat .tom/pull.pl6

    task-run "git pull", "git-pull";

    $ tom pull

# Platforms supported

* Linux
* Windows

# Author

Alexey Melezhik

