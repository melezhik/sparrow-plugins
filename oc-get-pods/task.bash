oc get pods -n $(config namespace) -o json > $cache_root_dir/state.json
echo save output to $cache_root_dir/state.json 
