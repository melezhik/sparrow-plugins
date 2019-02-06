debug=$(config debug)

[[ $debug ]] && set -x 

declare -a mount_table=$(config mount.table)

for point in ${mount_table[@]}; do
  dev=$( echo $point | cut -f 1 -d ":" )
  mount_point=$( echo $point | cut -f 2 -d ":")
  mkdir -p /mnt${mount_point}
  mount $dev /mnt${mount_point} || exit 10  
  echo "$dev mounted in /mnt${mount_point}"
done

echo "generating fstab..."
genfstab -U /mnt > /mnt/etc/fstab && echo "/ect/fstab generated... ok"
