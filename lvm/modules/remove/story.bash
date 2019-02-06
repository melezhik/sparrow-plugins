debug=$(config debug)

[[ $debug ]] && set -x 

required="lv vg"
for param in $required ; do
  if [[ -z $(config $param) ]]; then
    echo "Parameter $param required. Exiting..."
    exit 2
  fi
done

volume_group=$(config vg)
logical_volume=$(config lv)
use_force=$(story_var force)

remove_opts+="-y "

if [[ $use_force == true ]]; then
  remove_opts+="-f "
  umount "/dev/mapper/$volume_group-$logical_volume" 2>/dev/null
fi

lvs=$(check_lvs)

if [[ `echo $lvs | grep -w $logical_volume` ]]; then
  lvremove $remove_opts $volume_group/$logical_volume 
else
   echo 'No such volume group. Is it already removed or does not exist. Exiting...'
   exit 0
fi

lvs=$(check_lvs)

if [[ $lvs == 'false' ]] ; then
  echo "No logical volume left. Try to remove a volume group ( $volume_group )."
  vgremove $remove_opts $volume_group 
fi
