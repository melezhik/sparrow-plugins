debug=$(config debug)

[[ $debug ]] && set -x

recreate=$(config table.recreate)
device=$(config table.target)
type=$(config table.type)

table_exists=$(check_table $device)
parted_opts+=' -s'


if [[ $table_exists == 'true' ]]; then
  echo "disk's table already exists." 
  if [[ $recreate == 'true' ]]; then
    echo "but making a new one ($type) as a parameter for recreate is 'true'!"
    create_table
  fi
elif [[ $table_exists == 'false' ]] ; then
  echo "creating a new one table - ($type)"
  create_table
fi
