# SYNOPSIS

Walks through the list of sub directories ( located at $CWD ) and invoke git pull command for every directory found.

# INSTALL

    $ sparrow plg install git-dir-pull

# USAGE

CLI:

    # goes through every sub directory at $PWD
    # and runs `git pull` inside every directory
    # if directory .git found

    $ sparrow plg run git-dir-pull --cwd=$PWD

# Author

Alexey Melezhik

# See also

* [git](https://git-scm.com/)

