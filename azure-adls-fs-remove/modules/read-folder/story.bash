#!bash

adls=$(config adls)

#set -x

set -e

echo "[$c] load folder $path ..."

az dls fs list --account $adls --path $path -o json > $basedir/$c.json

