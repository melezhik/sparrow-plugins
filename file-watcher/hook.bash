
if [[ $destination_server ]] && [[ $destination_dir ]] && [[ $destination_user ]]; then 
  remote='true'
fi

run_story $action remote "$remote"
