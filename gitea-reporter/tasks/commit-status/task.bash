set -e

gt_url=$(config gitea_url)
sc_url=$(config sparrowci_url)

cat << HERE > $cache_dir/status.json
{
  "context": "hello",
  "description": "sparrowci build ok",
  "state": "success",
  "target_url": "$sc_url"
}
HERE

cat $cache_dir/status.json

curl -sf $gt_url/api/v1/repos/$user/$repo/statuses/$SCM_SHA?token=$GT_TOKEN \
  -d @$cache_dir/status.json  \
  -H "Content-Type: application/json"
