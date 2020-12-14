# SYNOPSIS

List total commits by author for period of time.


# INSTALL

    $ s6 --install git-commits-by-author-and-period

# USAGE

Cli

    $ s6 --plg-run git-commits-by-author-and-period

    $ s6 --plg-run git-commits-by-author-and-period@period=7 # for the last week

Raku

    my %state = task-run "commits-by-authors", "git-commits-by-author-and-period";

    for %state<list><> -> $i {
      say "author: {$i<author>}, commits: {$i<commits>}"
    }

# Parameters


## period

Period in days. Default values is `1` (  for the last day )


# Platforms supported

* Linux
* MacOS

# Requirements

Git client

# See also

https://gist.github.com/eyecatchup/3fb7ef0c0cbdb72412fc

# Author

Alexey Melezhik
