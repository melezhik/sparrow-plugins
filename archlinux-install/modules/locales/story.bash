debug=$(config debug)
[[ $debug ]] && set -x

default_locale=$(config locales.default)

if [[ `grep $default_locale /mnt/etc/locale.gen` ]]; then 
  echo "locale found..."
  sed -i 's/#'"${default_locale}"'/'"${default_locale}"'/' /mnt/etc/locale.gen || exit 12
  arch-chroot /mnt bash -c "locale-gen"
  default_locale=$(echo $default_locale | cut -f 1 -d " ")
  echo LANG="$default_locale" > /mnt/etc/locale.conf
else
  echo "Your $default_locale is unknown. Please check it."
  exit 11
fi
