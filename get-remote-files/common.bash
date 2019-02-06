main () {

if [[ -e $destination ]]; then
  file_exist=true
fi

if  [[ $file_exist == true ]] ; then
  if [[ $make_backup == true ]]; then
    cp $destination ${destination}.bak
   elif [[ -z $make_backup ]] && [[ $make_backup_global == true ]]; then
    cp $destination ${destination}.bak
   fi
fi 
  curl -s $target -o $destination
}
