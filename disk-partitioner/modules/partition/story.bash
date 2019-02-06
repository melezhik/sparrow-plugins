debug=$(config debug)

[[ $debug ]] && set -x

type=$(config partition.type)
device=$(config partition.target)
fs=$(config partition.fs.type)
start=$(config partition.start)
end=$(config partition.end)
fs_options=$(config partition.fs.options)
declare -a flags=$(config partition.flags)

parted -s $device mkpart $type $start $end

  partition_number=$(parted -s "$device" print | awk {'print $1'} | tail -2 | head -1)

if [[ $fs ]]; then
  if [[ $fs = 'fat32' ]]; then
    mkfs.msdos $fs_option -F 32 ${device}${partition_number}
  else
  mkfs.$fs $fs_options ${device}${partition_number}
  fi
fi

if [[ $flags ]]; then
  echo "set flags - $flags"...
  for flag in ${flags[@]}; do
    parted $device set $partition_number $flag on
  done
fi
