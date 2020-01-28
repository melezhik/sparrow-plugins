# SYNOPSIS

Fetch zef distribution and return download directory

# INSTALL

    $ s6 --install zef-fetch

# USAGE

```
my %state = task-run 'zef fetch Kind', 'zef-fetch', %(
  identity => 'Kind'
);

say %state<directory>;
```

# Parameters

* `identity`

Zef identity - module, distribution, so on. Required

* `user`

Run zef for certain user

# See also

* [zef](https://github.com/ugexe/zef)

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

