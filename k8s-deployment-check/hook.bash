#!bash

set -e

resource_type=$(config resource_type)

name=$(config name)

namespace=$(config namespace)

set -x

kubectl get $resource_type $name -n $namespace -o json > $cache_root_dir/state.json

set_stdout get $resource_type $name -n $namespace -o json
