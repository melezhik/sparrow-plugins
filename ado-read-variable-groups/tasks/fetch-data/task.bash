#!bash

set -e

. ~/.sparrow-azure-devops.sh

project=$(config project)

debug=$(config debug)

if test "${debug}" = "True"; then
  echo curl -s -f -u $user:**** $api/$project/_apis/distributedtask/variablegroups?api-version=5.0-preview.1  \
  -H "Content-Type: application/json"
fi

curl -s -f -u $user:$token $api/$project/_apis/distributedtask/variablegroups?api-version=5.0-preview.1  \
-H "Content-Type: application/json" -o $cache_root_dir/state.json




