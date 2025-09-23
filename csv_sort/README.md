# SYNOPSIS

sort csv file by column name

# INSTALL

    $ s6 --install csv_sort

# USAGE

## Raku

```raku
#!raku

task-run "sort files", "csv_sort", %(
  file => "data.csv",
  by => "name",
  out => "/tmp/data.sorted.csv",
);
```

# Parameters

## file

Path to file

## by

Name of a column to sort by

## out

Where to dump resulted file, path

## int

Sorted column is integer, optional, default is `False`
# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
