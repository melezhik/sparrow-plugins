set -e

gt_url=$(config getea_url)

cat << HERE > $cache_dir/status.json
{
  "context": "hello",
  "description": "sparrowci build ok",
  "state": "success",
  "target_url": "http://127.0.0.1:2222"
}
HERE

cat $cache_dir/status.json

curl -f $gt_url/api/v1/repos/$user/$repo/statuses/$SCM_SHA?token=$GT_TOKEN \
  -d @status.json  \
  -H "Content-Type: application/json"
