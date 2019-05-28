#!bash

run_task get-hosts output "$cache_dir/hosts.json"
run_task get-ips json "$cache_dir/hosts.json"
