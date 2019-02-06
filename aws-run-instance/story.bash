set -e

subnet=$(config subnet)
image=$(config image)
type=$(config type)
tag_key=$(config tag_key)
tag_value=$(config tag_value)
associate_public_ip=$(config associate_public_ip)
key=$(config key)
sec_groups=$(config sec_groups)

if test -z $key; then
  keyname="";
else
  keyname="--key-name $key";
fi

if test "${associate_public_ip}" = "on"; then
  opts="--associate-public-ip-address";
else
  opts=""
fi

if test -z $sec_groups; then
  sec_g_opts=""
else
  sec_g_opts="--security-group-ids $sec_groups"
fi


if test -z $tag_key; then

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname $opts ...
  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type $keyname $opts $sec_g_opts

else

  echo aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname $opts $sec_g_opts ...

  aws ec2 run-instances --subnet-id $subnet --image-id $image --instance-type $type \
  --tag-specifications 'ResourceType=instance,Tags=[{Key='$tag_key',Value='$tag_value'}]' $keyname $opts $sec_g_opts

fi  



