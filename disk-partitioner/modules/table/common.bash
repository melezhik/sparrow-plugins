check_table () {
device=$1

if [[ ! `parted $device print | grep 'Partition Table: unknown'` ]]; then
  echo "true"
else
  echo "false"
fi
}

create_table() {
if [[ $type == 'dos' ]] || [[ $type == 'mbr' ]]; then
  type=msdos
fi
parted $parted_opts $device mklabel $type
}
