set -e

name=$(config name)
image=$(config image)
type=$(config type)

id=$(aws ec2 run-instances \
  --image-id $image \
  --count 1 \
  --instance-type $type  \
  --subnet-id $sn \
  | yq ".Instances | .[0] | .InstanceId")

aws ec2 create-tags \
   --resources $id \
   --region $region  \
    --tags "Name=$name"
