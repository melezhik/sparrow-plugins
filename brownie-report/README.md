# SYNOPSIS

Utility to generate brownie report


# INSTALL

    $ s6 --install brownie-report

# USAGE

```raku

# list available versions
task-run "list", "brownie-report", %(
  :action<list>,
);

# print comparison report
# for two Rakudo versions

my $s = task-run "report", "brownie-report", %(
  :new<sha1>,
  :old<sha2>,
);

say $s<list><>.raku; # print modules list

```

# Parameters

* `new`

Rakudo version commit

* `old` 

Rakudo version commit


# Author

Alexey Melezhik
