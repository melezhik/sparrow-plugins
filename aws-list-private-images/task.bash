aws ec2 describe-images  --filters Name=is-public,Values=false --query 'Images[*].{ ID:ImageId Description:Description Date:CreationDate VirtType:VirtualizationType }'
