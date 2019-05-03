name=$(config name)
set -e

if [ $(getent group $name) ]; then
  if [[ $os == alpine ]]; then
    delgroup $name
  else
    groupdel $name
  fi
else
  echo "group $name does not exist"
fi
