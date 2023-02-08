set -e

name=$(config name)

instance_id=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=$name" \
  | yq ".Reservations | .[0] | .Instances \
  | .[0]| .InstanceId")
 
if test "$instance_id" != "null"; then
    echo "{ \"id\": \"$instance_id\" }" > $cache_root_dir/state.json 
else
    echo "{ \"id\": \"\" }" > $cache_root_dir/state.json 
fi
