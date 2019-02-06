debug=$(config debug)
[[ $debug ]] && set -x

files=$( find_targets )
remote=$( story_var remote )

for file in $files; do

  echo "Processing file: $file"

  if [[ "$remote" == 'true' ]]; then
    if [[ "$dry_run" ]]; then
       echo -e "Your cmd for rsync will be: 

       rsync -z --remove-source-files -e "ssh -F $ssh_config_created" $file $destination_user@$destination_server:$destination_dir/
       "

    else
      create_ssh_config

      rsync -z --remove-source-files -e "ssh -F $ssh_config_created" $file $destination_user@$destination_server:$destination_dir/ 

    fi
  else

    if [[ "$dry_run" ]]; then

       echo "Your $file will be moved to $destionation_dir"

    else

    mv $file $destination_dir || exit 16
    echo "File $file moved to $destination_dir"
    fi
  fi

done
