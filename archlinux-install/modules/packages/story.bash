debug=$(config debug)
[[ $debug ]] && set -x

declare -a install_packages=$(config packages.installed)

for package in ${install_packages[@]}; do
  arch-chroot /mnt pacman -S --noconfirm $package
done
