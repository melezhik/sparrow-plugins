#!/bin/bash

set -e

mkdir -p ~/.sqltextify

sql_tmpfile=$(mktemp ~/.sqltextify/abc-script.XXXXXX)

sql=$(config sql)

echo "$sql" > $sql_tmpfile

sqltextify.pl --sql $sql_tmpfile $(cli_args)

unlink $sql_tmpfile

