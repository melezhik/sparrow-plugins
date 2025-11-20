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

task-run "report", "brownie-report", %(
  :new<sha1>,
  :old<sha2>,
);
```

# Parameters

* `new`

Rakudo version commit

* `old` 

Rakudo version commit


# Author

Alexey Melezhik
