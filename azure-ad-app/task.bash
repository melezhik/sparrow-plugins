set -e

name=$(config displayName)

echo "look up app registered with displayName: ${name}"

az ad app list --query "[?displayName=='$name']|[0]" > $cache_root_dir/state.json

if test ! -s $cache_root_dir/state.json; then
  echo "no info found"
  exit 2
fi
