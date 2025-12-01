# SYNOPSIS

Utility to generate brownie logs for installed modules


# INSTALL

    $ s6 --install brownie-logs

# USAGE

```raku

my $module = "Kind";

task-run "logs", "brownie-logs", %(
  :$module,
);

```

# Parameters

* `module`

Rakudo module

# Author

Alexey Melezhik
