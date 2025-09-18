# SYNOPSIS

Parses red release file
# INSTALL

    $ s6 --install redhat-version

# USAGE

## Raku

```raku
#!raku

my $s = task-run "parse", "redhat-version", %(
  :sudo,
);

say $s<version>;

```

# Parameters

## sudo

Runs under sudo. Optional. Default is False

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
