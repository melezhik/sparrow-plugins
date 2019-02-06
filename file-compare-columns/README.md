# SYNOPSIS

Simple file/columns compare tool

# Description

Print all lines from File `$file1` + column with number `$mismatch_col_num` from File `$file2` 
if the column with number `$match_col_num` in both files matches but column with number `$mismatch_col_num` doesn't match. 

# INSTALL

    $ sparrow plg install file-compare-columns

# USAGE

    $ sparrow plg run file-compare-columns \
    --format concise \ # to hide overly info 
    --param file1=/path/to/file1 \
    --param file2=/path/to/file2 \
    --param match_col_num=1 \
    --param mismatch_col_num=3

# Plugin maintainer

Alexey Melezhik

