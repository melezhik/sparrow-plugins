debug=$(config debug)
[[ $debug ]] && set -x 

raw_part=$(config disk.partition)
lvm=$(config disk.lvm)
lvm_vg=$(config disk.lvm.vg)
lvm_lv=$(config disk.lvm.lv)

if [[ $raw_part ]] && [[ $lvm ]]; then
  echo "Choose one. Raw partition (e.g. /dev/sda1) or lvm"
  exit 1
fi

if [[ $lvm ]]; then
  if [[ $lvm_vg ]] && [[ $lvm_lv ]]; then
    install_partition=/dev/mapper/${lvm_vg}-${lvm_lv}
    lvm_used='true'
  elif [[ ! $lvm_vg ]] || [[ ! $lvm_lv ]]; then
    echo "I need a volume group and a logical volume"
    exit 2
  fi
elif [[ $raw_part ]]; then
  install_partition=$raw_part
fi

mount $install_partition /mnt

mkdir /mnt/boot

pacstrap /mnt base

if [[ $lvm_used == true ]] ;then
  MKINITCPIO_CONF=/mnt/etc/mkinitcpio.conf
  hooks=$(grep '^HOOKS=' $MKINITCPIO_CONF)
  if [[ ! `echo $hooks | grep lmv2` ]]; then
    sed -i.bak '/^HOOKS=/ s/)$/ lvm2)/' $MKINITCPIO_CONF 
  arch-chroot /mnt /bin/bash -c "mkinitcpio -p linux"
  fi
fi
