debug=$(config debug)
[[ $debug ]] && set -x

grub_target=$(config bootloader.grub.target)
grub_type=$(config bootloader.grub.type)
grub_partition=$(config bootloader.grub.partition)

final_action () {
  arch-chroot /mnt grub-install $grub_target 
  if [[ ! $? == 0 ]]; then
    echo "something wrong with installation of grub. Skipping..."
	exit 5
  fi
  arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
}

if [[ $grub_target ]]; then
  arch-chroot /mnt pacman -S --noconfirm grub os-prober 
  if [[ $grub_type == 'efi' ]] && [[ $grub_partition ]]; then
	real_efi_partition=$(fdisk -o Type,Device -l $grub_target | grep EFI | awk '{ print $3}')
    if [[ $real_efi_partition == $grub_partition ]]; then
	  mkfs.fat -F32 $grub_partition
	  mkdir /mnt/boot/efi
	  arch-chroot /mnt pacman -S --noconfirm efibootmgr
	  mount $grub_partition /mnt/boot/efi
	else
	  echo "It seems your desired partition ( $grub_partition ) is not a ESP. Check it."
	  #[[ -z $real_efi_partition ]] && echo "Your disk ( $grub_target ) doesn't have ESP."
	  exit 3
	fi
	final_action 
  elif [[ $grub_type == 'bios' ]]; then 
	final_action
  fi
else 
  echo "grub target in unknown".
  exit 4
fi
