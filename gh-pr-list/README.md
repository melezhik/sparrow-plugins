# SYNOPSIS

Get a PRs list for a GutHub repository

# INSTALL

    $ s6 --install gh-pr-list

# USAGE

Cli

    s6 --plg-run gh-pr-list
    s6 --plg-run gh-pr-list@state=closed
    s6 --plg-run gh-pr-list@repo="../repo../repo2 ../repo3"


Raku

    my %state = task-run "open pr", "gh-pr-list", %(
      repo => "repo1 repo2 repo3"
      state => "open"
    );

    say %state<list>;

# Parameters

## state

PR state. Default value is `open`

## repo

Local git repositories folders. Default value is `$PWD` Examples:

    repo => "repo1" # repo in ./repo1 folder

    repo => "projects/repo1 projects/repo2" # 2 repositories repo1 and repo2 in ./projects folder

    repo => "/home/melezhik/projects/repo1" # You can use absolute paths

# Requirements

GH cli should be installed

# Author

Alexey Melezhik
