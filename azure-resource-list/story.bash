#!bash

set -e

group=$(config group)
pattern=$(config pattern)


if test -z "${pattern}"; then
  set -x
  az resource list -g ${group} -o table
else
  set -x
  az resource list -g ${group} -o table | grep "${pattern}" || echo "no resources found"
fi



