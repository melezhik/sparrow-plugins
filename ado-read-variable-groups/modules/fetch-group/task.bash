#!bash


set -e

user=$(config user)
token=$(config token)

project=$(config project)
group_id=$(config group_id)

debug=$(config debug)

if test "${debug}" = "True"; then
  set -x
fi

curl -s -f -u $user:$token \
https://dev.azure.com/chevron/$project/_apis/distributedtask/variablegroups/$group_id?api-version=5.0-preview.1  \
-H "Content-Type: application/json" > $output




