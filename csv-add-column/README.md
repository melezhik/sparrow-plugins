# SYNOPSIS

Add Column to end every line in CSV file using awk.

The author of original awk script is [birei](https://stackoverflow.com/users/773159/birei)
the code is taken from [StackOverflow](https://stackoverflow.com/a/9506868/5147708).

# INSTALL

    $ s6 --install csv-add-column

# USAGE

To add `date` value to the end of every line in CSV `$file`:

    $ s6 --plg-run csv-add-column@\
    --format concise\
    ,file=/path/to/file/example.csv\
    ,data="`date`" > output.csv

# Plugin maintainer

Alexey Melezhik

# Prerequisites

Awk should be installed
