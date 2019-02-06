debug=$(config debug)
[[ $debug ]] && set -x 

required="lv vg partition size"
for param in $required ; do
  if [[ -z $(config $param) ]]; then
    echo "Parameter $param required. Exiting..."
    exit 2
  fi
done

partition=$(config partition)
volume_group=$(config vg)
logical_volume=$(config lv)
size=$(config size)
fs=$(config fs.type)
fs_options=$(config fs.options)

create_opts=' -y'

vg_exist=$(vgs $volume_group 2>/dev/null | grep -o $volume_group) 
if [[ $vg_exist ]]; then
  echo "A volume group $volume_group already created. Moving further."
else
  vgcreate $create_opts $volume_group $partition || exit 4
fi

lvs=$(check_lvs)

if [[ `echo $lvs | grep -w $logical_volume` ]]; then
  echo "A logical volume $logical volume already created. Nothing to do."
else
  lvcreate $create_opts -L $size -n $logical_volume $volume_group
fi

if [[ $fs ]]; then
  mkfs.$fs $fs_options /dev/mapper/${volume_group}-${logical_volume}
fi
