#!bash

adls=$(config adls)

set -x

az dls fs access show --path "${path}"  -n "${adls}" -o json > $output

echo

