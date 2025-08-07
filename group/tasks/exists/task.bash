g=$(config name)

if getent group $g; then
  echo "group exists";
else
  echo "group not exists";
fi
