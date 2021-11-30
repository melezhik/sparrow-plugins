# SYNOPSIS

List total commits by author (sorted by commit count)

# INSTALL

    $ s6 --install git-updated-dirs

# USAGE

    my %state = task-run "files/tasks/git-updated-dirs", %(
      dir => "scm",
      commit_old => $old-commit-sha,
      commit_new => $new-commit-sha,
      level => 0,
    );

    say %state<list><>;

# Parameters

## dir

Directory with a local git repo

## level

Level of directories. Optional. Default value is `0` 

# Requirements

Git client

# See also

https://gist.github.com/eyecatchup/3fb7ef0c0cbdb72412fc

# Author

Alexey Melezhik
