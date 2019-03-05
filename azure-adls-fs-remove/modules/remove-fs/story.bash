#!bash

adls=$(config adls)

#set -x

set -e

echo "remove $path ..."

echo az dls fs delete --account $adls --path $path

