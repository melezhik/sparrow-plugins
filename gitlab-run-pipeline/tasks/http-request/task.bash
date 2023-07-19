#!bash

#set -x

set -e

if test -f  ~/.gitlab.sh; then
  echo "loading credentials from  ~/.gitlab.sh"
  source ~/.gitlab.sh
elif test -z $gitlab_trigger; then
  echo "gitlab_trigger varibale is not defined"
  exit 2
fi

ref=$(config ref)
prepare_env_vm=$(config prepare_env_vm)
project=$(config project)
gitlab_api=$(config gitlab_api)
debug=$(config debug)

cmd="curl -X POST -fs -F token=$gitlab_trigger \
-F ref=$ref $variables \
$gitlab_api/projects/$project/trigger/pipeline"

if test "$debug" = "True"; then
  echo $cmd
fi

eval $cmd
