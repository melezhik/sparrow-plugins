# SYNOPSIS

Golang API example


# INSTALL

    $ s6 --install go-example

# USAGE

```
my $s = task-run "go api", "go-example", %(
  foo => "Bar"
);

say "message: ", $s<state><Message>;

```
# Author

Alexey Melezhik

