# SYNOPSIS

Install Rakudo via Rakubrew installer

# Description

This is simple installer of Rakudo based on [Rakubrew](https://rakubrew.org) installer

# Install

```bash
#!bash
$ s6 --install rakudo-install
```

# Usage

## Raku

```raku
#!raku
task-run 'install Rakudo 2025.06', 'rakudo-install', %(
  :version<2025.06>,
  :user<alex>,
);
```

# Parameters

## version

Version to install. Optional, default value is `2025.08`

## user

Install for user. Optional. Default value is not set.

# Author

Alexey Melezhik
