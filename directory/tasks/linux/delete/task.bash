path=$(config path)

if test -d "${path}"; then
  rm -rf $path
fi

echo directory-delete-ok



