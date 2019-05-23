set -e

user=$(config name)

managehome=$(config managehome)

if [[ $managehome == yes ]]; then
  if [[ $os == alpine ]]; then
    args=" --remove-home"
  else
    args=" -r"
  fi
fi

if [[ $os == alpine ]]; then
  deluser $args $user
else
  userdel $args $user
fi


id $user 2>/dev/null || echo "user $user removed"

