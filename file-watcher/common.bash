action=$(config action)
dry_run=$(config dry)

dir=$(config directory)

destination_dir=$(config destination.directory)
destination_server=$(config destination.server)
destination_user=$(config destination.user)
ssh_private_key=$(config destination.ssh_private_key)

condition_older=$(config conditions.older)
condition_newer=$(config conditions.newer)

rsync_opts=$(config rsync.options)
ssh_config_created=$(config ssh.config)

if [[ $ssh_private_key ]]; then
  ssh_opts+="IdentityFile $ssh_private_key"
fi

create_ssh_config() {
cat << CONFIG > $ssh_config_created
Host $destination_server
  $ssh_opts
CONFIG
}

translate_time() {

  c=$( echo "$1" | cut -f 1 -d " " )
  if [[ "$1" == *"day"* ]]; then
    let pattern_min=$c*1440
  else
    pattern_min="$c"
  fi

}

find_targets() {

  if [[ $condition_newer ]]; then
    translate_time "$condition_newer"
    find_cmd+=" -mmin -$pattern_min"
  fi

  if [[ $condition_older ]]; then
    translate_time "$condition_older"
    find_cmd+=" -mmin +$pattern_min"
  fi
  
  files=$(find "$dir" -type f $find_cmd)

  if [[ -z "$files" ]]; then
    echo "No files found" >&2
  else
    echo "$files"
  fi
}

