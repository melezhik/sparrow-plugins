debug=$(config debug)
[[ $debug ]] && set -x

declare -a services=$(config services.enabled)

for service in ${services[@]}; do
  arch-chroot /mnt systemctl enable $service
done
