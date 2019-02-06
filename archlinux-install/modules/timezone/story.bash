debug=$(config debug)
[[ $debug ]] && set -x

timezone=$(config timezone)

if [[ `find /mnt/usr/share/zoneinfo/$timezone` ]]; then 
  echo "Setting timezone..."
  arch-chroot /mnt bash -c "ln -sf /usr/share/zoneinfo/$timezone /etc/localtime"
else
  echo "Your timezone ( $timezone ) is unknown. Please check it."
  exit 10
fi
