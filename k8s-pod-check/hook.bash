set -e
set -x
kubectl get pods -n $(config namespace) -o json > $cache_root_dir/state.json
#set_stdout $cache_root_dir/state.json
kubectl get pods -n $(config namespace) > $cache_root_dir/data.txt
