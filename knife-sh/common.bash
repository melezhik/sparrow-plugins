action=$( config action )
ignore_errors=$( config ignore_errors )
hosts=$( config hosts )

exec_file=$( config exec_file )

source=$( config source)
destination=$( config destination )

ssh_key=$( config identity-file )
ssh_user=$( config ssh-user )
options=$( config options )

build_cmd () {
  if [[ $action == 'copy' ]]; then

    cmd="$exec_file -c $source:$destination"
  else
    cmd="$exec_file"
  fi

  [[ $ssh_key ]] && cmd+=" -i $ssh_key"
  [[ $ssh_user ]] && cmd+=" -x $ssh_user"
  [[ $options ]] && cmd+=" $options"
}
