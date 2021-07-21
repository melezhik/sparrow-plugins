#!bash

set -e

name=$(config name)

namespace=$(config namespace)

set -x

kubectl get deployment $name -n $namespace -o json > $cache_root_dir/state.json

