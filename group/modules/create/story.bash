set -e
name=$(config name)

if [ $(getent group $name) ]; then
    echo "group $name already exists"
else
  if [[ $os == alpine ]]; then
    addgroup $name
  else
    groupadd -f $name
  fi
fi


