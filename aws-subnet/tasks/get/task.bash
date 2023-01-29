set -e

sb_name=$(config sb_name)

SubnetId=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=$sb_name" \
  | yq ".subnets | .[0] | .SubnetId")

if test "$SubnetId" != "null"; then
  echo "subnet [$sb_name] found, sn-id: $SubnetId"
  cat << HERE > $cache_root_dir/state.json
{
  "sn-id": "$SubnetId"
}
HERE
else
  echo "subnet not found"
cat << HERE > $cache_root_dir/state.json
{
  "sn-id": ""
}
HERE
