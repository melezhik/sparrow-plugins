#!bash

adls=$(config adls)

set -x

set -e

az dls fs delete --account $adls --path $path

