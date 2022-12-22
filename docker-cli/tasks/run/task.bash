set -e

image=$(config image)
name=$(config name)
secrets=$(config secrets)
options=$(config options)
vault_path=$(config vault_path)
dry_run=$(config dry_run)

echo "about to start docker name=$name, image=$image, dry_run=$dry_run"

#set -x

options_docker=""

if test -n "$secrets"; then
  echo "pass secrets from vault: $secrets"
  for v in $secrets; do
    options_docker="$options_docker --env $v=\$(vault kv get --field value ${vault_path}/${v})"
  done
fi

if test -n "$options"; then
  echo "pass options: [$options]"
  options_docker="$options_docker $options"
fi

echo "docker run --rm -td $options_docker --add-host=host.docker.internal:host-gateway --name $name $image" \
  > $cache_dir/command.bash

if test $dry_run = "True"; then
  echo "would run this command:"
  cat $cache_dir/command.bash
  echo "dry run is on, exiting"
else
  source $cache_dir/command.bash
fi
