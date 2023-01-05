set -e

gt_url=$(config gitea_url)

cat << HERE > $cache_dir/status.json
{
  "context": "SparrowCI",
  "description": "build: $status",
  "state": "$status",
  "target_url": "$BUILD_URL"
}
HERE

cat $cache_dir/status.json

curl -sf $gt_url/api/v1/repos/$user/$repo/statuses/$SCM_SHA?token=$GT_TOKEN \
  -d @$cache_dir/status.json  \
  -H "Content-Type: application/json" \
  -D -
