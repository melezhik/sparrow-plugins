#!bash

adls=$(config adls)

set -x

set -e

echo "remove $path ..."

az dls fs delete --account $adls --path $path

