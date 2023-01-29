set -e

sb_name=$(config sb_name)
cidr_block=$(config cidr_block)
vpc_id=$(config vpc_id)
aws ec2 create-subnet \
--vpc-id $vpc_id \
--cidr-block $cidr_block \
--tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=$sb_name}]'
