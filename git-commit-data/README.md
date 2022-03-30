# SYNOPSIS

Get git commit data

# INSTALL

     s6 --install git-commit-data

# Usage

```
my $s = task-run "git data", "git-commit-data";

say "sha: ", $s<sha>;
say "comment: ", $s<comment>;
```

# Parameters


## dir

Chdir to `dir`. Optional. Default value is `.` (cwd)

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


