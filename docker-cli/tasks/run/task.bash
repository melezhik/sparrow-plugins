set -e

image=$(config image)
name=$(config name)
vars=$(config vars)
vault_path=$(config vault_path)
dry_run=$(config dry_run)

echo "about to start docker name=$name, image=$image, dry_run=$dry_run"

#set -x

vars_docker=""

if test -n "$vars"; then
  echo "pass vars from vault: $vars"
  for v in $vars; do
    vars_docker="$vars_docker --env $v=\$(vault kv get --field ${v} ${vault_path})"
  done
fi

echo "docker run --rm -td $vars_docker --add-host=host.docker.internal:host-gateway --name $name $image" \
  > $cache_dir/command.bash

if test $dry_run = "True"; then
  echo "would run this command:"
  cat $cache_dir/command.bash
  echo "dry run is on, exiting"
else
  source $cache_dir/command.bash
fi
