#!bash

set -e

group=$(config group)

set -x

az resource list -g $group -o json > $output

