# SYNOPSIS

Walks through the list of sub directories ( located at $CWD ) and invoke git pull command for every directory found.

# INSTALL

    $ s6 --install git-dir-pull

# USAGE

CLI:

    # goes through every sub directory at $PWD
    # and runs `git pull` inside every directory
    # if directory .git found

    $ s6 --plg-run git-dir-pull --cwd=$PWD

# Author

Alexey Melezhik

# See also

* [git](https://git-scm.com/)

