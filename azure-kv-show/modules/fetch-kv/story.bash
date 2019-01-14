set -e

kv=$(story_var kv)
secret=$(story_var secret)
output=$(story_var output)

set -x

if az keyvault secret show --name "${secret}" --vault-name "${kv}" -o json > $cache_dir/$secret.out; then
  mv $cache_dir/$secret.out $output
fi
