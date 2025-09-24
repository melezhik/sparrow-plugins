# SYNOPSIS

Add column to the every record of CSV file

# INSTALL

    $ s6 --install csv-add-column

# USAGE

## Cli

To add `date`:

    $ s6 --plg-run csv-add-column@in=example.csv,data="$(date)",out=out.csv

## Raku


```raku
#!raku

task-run "add date", "csv-add-column", %(
  :in<example.csv>,
  :out</tmp/out.csv>,
  :date<123>,
);
```

# Parameters

## in

Input file

## out

Output file

## data

Column value

# Author

Alexey Melezhik

# Prerequisites

Awk

# Credits

* The author of original awk script is [birei](https://stackoverflow.com/users/773159/birei)

* The code is taken from [StackOverflow](https://stackoverflow.com/a/9506868/5147708).
