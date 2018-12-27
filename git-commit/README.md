# SYNOPSIS

Make git commit

# INSTALL

    $ sparrow plg install git-commit

# USAGE

Tomtit sceanrio:

    $ cat .tom/commit.pl6

    my $msg = prompt("message: ");

    task-run "commit my changes", "git-commit", %( message => $msg );

    $ tom commit

# Author

Alexey Melezhik

