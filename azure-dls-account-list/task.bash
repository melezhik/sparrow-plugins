#!bash

set -e

group=$(config group)

set -x

az dls account list -g ${group} -o table



