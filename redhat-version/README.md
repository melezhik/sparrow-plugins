# SYNOPSIS

Parses redhat release file

# INSTALL

    $ s6 --install redhat-version

# USAGE

## Bash

```bash
  eval $(s6 --plg-run --inline redhat-version)
  echo $rh_version
  echo $rh_version_major
  echo $rh_version_minor
```
## Raku

```raku
#!raku

my $s = task-run "parse", "redhat-version", %(
  :sudo,
);

say $s<version>;  # full version
say $s<major>;    # major version
say $s<minor>;    # minor version

```

# Parameters

## sudo

Runs under sudo. Optional. Default is False

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
