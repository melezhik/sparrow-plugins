# SYNOPSIS

Make git push for current local branch

# INSTALL

    $ s6 --install git-push

# USAGE

Tomtit sceanrio:

    $ cat .tom/push.pl6

    task-run "push my changes", "git-push";

    $ tom push 

# Parameters

## confirm

`yes|no`

Set `confirm` to `no` to disable confirmation dialogue:

    task-run "push my changes", "git-push", %( confirm => "no" );

# Author

Alexey Melezhik

