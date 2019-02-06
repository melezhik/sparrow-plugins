debug=$(config debug)
[[ $debug ]] && set -x

files=$( find_targets )
remote=$( story_var remote )

for file in $files; do

  echo "Processing file: $file"

  if [[ "$remote" == 'true' ]]; then

    if [[ "$dry_run" ]]; then
       echo -e "Your cmd for rsync will be: 

       rsync -z -e "ssh -F $ssh_config_created" $file $destination_user@$destination_server:$destination_dir/
       "

    else
      create_ssh_config

      rsync -z -e "ssh -F $ssh_config_created" $file $destination_user@$destination_server:$destination_dir/ 
    fi
  else
    if [[ "$dry_run" ]]; then
       echo "Your $file will be copied to $destionation_dir"
    else

    cp $file $destination_dir || exit 16
    echo "File $file copied to $destination_dir"
    fi

  fi

done

