# SYNOPSIS

Make git commit

# INSTALL

    $ s6 --install git-commit

# USAGE

Tomtit sceanrio:

    $ cat .tom/commit.pl6

    my $msg = prompt("message: ");

    task-run "commit my changes", "git-commit", %( message => $msg );

    $ tom commit

# Run spell checks

    check_spell => True

If `check_spell` is set, run spell checks commit message by using `hunspell`

# Author

Alexey Melezhik

