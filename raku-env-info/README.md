# SYNOPSIS

Dump Raku environment info

# INSTALL

     s6 --install raku-env-info

# Usage

```
my $s = task-run "dump info", "raku-env-info";

say "raku env: ", $s<raku>;
say "zef env: ", $s<zef>;
```

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


