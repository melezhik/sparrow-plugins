set -e

image=$(config image)
name=$(config name)
vars=$(config vars)
vault_path=$(config vault_path)

#set -x

vars_docker=""

echo "pass vars from vault: $vars"
if test -n "$vars"; then
  for v in $vars; do
    vars_docker="$vars_docker --env $v=\$(vault kv get --field value --format table ${vault_path}${v})"
  done
fi

echo docker run --rm -td \
  $vars_docker \
  --add-host=host.docker.internal:host-gateway \
  --name $name $image
