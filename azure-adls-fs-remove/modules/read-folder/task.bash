#!bash

adls=$(config adls)

#set -x

set -e

echo "[$c] fetch folder $path"

az dls fs list --account $adls --path $path -o json > $basedir/$c.json

