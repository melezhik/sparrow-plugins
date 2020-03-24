#!/bin/bash

set -e

mkdir -p ~/.sqltextify

sql_tmpfile=$cache_dir/query.sql

sql=$(config sql)

echo "$sql" > $sql_tmpfile

echo "run query from {$sql_tmpfile}"

sqltextify.pl --sql $sql_tmpfile $(config args) > data.out

cat data.out

echo "report saved to out.data"


