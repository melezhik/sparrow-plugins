main_install=$(config main.install)
root_pass=$(config rootpw)
hostname=$(config hostname)
timezone=$(config timezone)
used_grub=$(config bootloader.grub)
mount_table=$(config mount.table)
used_packages=$(config packages)
used_services=$(config services)
used_locales=$(config locales)
used_mirrorlist=$(config mirrorlist)

if [[ $used_mirrorlist ]]; then
  run_story mirrorlist
fi

if [[ $main_install == 'true' ]]; then
  run_story main
fi

if [[ "$mount_table" ]] || [[ $main_install == 'true' ]]; then
  run_story mount_table
else
  echo "/etc/fstab will not be created..."
fi

if [[ "$used_grub" ]]; then
  run_story grub
else 
  echo "You must prepare your bootloader manually."
fi

if [[ "$hostname" ]]; then
  run_story hostname
fi

if [[ "$root_pass" ]]; then
  run_story root_pass
fi

if [[ "$timezone" ]]; then
  run_story timezone
fi

if [[ "$used_locales" ]]; then
  run_story locales
fi

if [[ "$used_packages" ]]; then
  run_story packages
fi

if [[ "$used_services" ]]; then
  run_story services
fi
