#!bash

run_task get-hosts output "$cache_dir/hosts.json"
run_task parse-hosts json "$cache_dir/hosts.json"
run_task parse-ips
