set -e
name=$(config name)

if [ $(getent group $name) ]; then
    echo "group $name already exists"
else
  if [[ $os == alpine ]]; then
    echo "create group $name"
    addgroup $name
  else
    echo "create group $name"
    groupadd -f $name
  fi
fi


