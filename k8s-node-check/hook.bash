#!bash

set -e

name=$(config name)

set -x

kubectl get node $name -o json > $cache_root_dir/state.json

set_stdout get node $name -o json
