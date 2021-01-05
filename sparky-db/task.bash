set -e

db=$(config db)

if test -n $db; then
  echo "db passed: $db"
fi

if test "$os" = "darwin"; then
  $root_dir/mac/cli $db
else
  $root_dir/linux/cli $db
fi
