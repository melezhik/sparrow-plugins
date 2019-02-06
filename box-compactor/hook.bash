
clean_cache=$(config clean_cache)
zero_disk=$(config zero_disk)

if [[ $clean_cache == 'true' ]];then
  run_story clean_cache
fi

if [[ $zero_disk == 'true' ]];then
  run_story zero_disk
fi
