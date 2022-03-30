#!bash

set -e

resource_type=$(config type)

name=$(config name)

namespace=$(config namespace)

set_stdout "================================================================================"
set_stdout ">>> verify [resource=${resource_type}] [name=${name},namespace=${namespace}]"

set -x

if kubectl get $resource_type $name -n $namespace -o json > $cache_root_dir/state.json; then
  set_stdout 'resource exists'
else
  echo '[]' >  $cache_root_dir/state.json
fi


if test ! $(config die-on-check-fail) = "false"; then
  ignore_task_check_error
fi
