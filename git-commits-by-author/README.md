# SYNOPSIS

List total commits by author (sorted by commit count)

# INSTALL

    $ s6 --install git-commits-by-author

# USAGE

Cli

    $ s6 --plg-run git-commits-by-author

Raku

    my %state = task-run "commits-by-authors", "git-commits-by-author";

    for %state<list><> -> $i {
      say "author: {$i<author>}, commits: {$i<commits>}, email: {$i<email>}"
    }

# Platforms supported

* Linux
* MacOS

# Requirements

Git client

# See also

https://gist.github.com/eyecatchup/3fb7ef0c0cbdb72412fc

# Author

Alexey Melezhik
