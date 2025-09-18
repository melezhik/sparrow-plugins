sudo=$(config sudo)

if test "$sudo" = True; then
  sudo cat /etc/redhat-release
else
  cat /etc/redhat-release
fi

