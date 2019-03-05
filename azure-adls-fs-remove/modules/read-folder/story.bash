#!bash

adls=$(config adls)

set -x
set -e

az dls fs list --account $adls --path $path -o json > $output

