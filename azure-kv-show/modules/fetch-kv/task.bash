set -e

kv=$(task_var kv)
secret=$(task_var secret)
output=$(task_var output)

set -x

if az keyvault secret show --name "${secret}" --vault-name "${kv}" -o json > $cache_dir/$secret.out; then
  mv $cache_dir/$secret.out $output
fi
