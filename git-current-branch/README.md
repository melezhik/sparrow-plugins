# SYNOPSIS

Get current git branch

# INSTALL

    $ s6 --install git-current-branch

# USAGE

    my %state = task-run "current branch", "git-current-branch";

    say %state<branch>;

# Author

Alexey Melezhik
