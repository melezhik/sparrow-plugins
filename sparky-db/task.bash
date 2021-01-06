set -e

db=$(config db)
max=$(config max)

if test -z "$db"; then
  db=~/.sparky/projects/db.sqlite3  
else
  echo "db passed: [$db]"
fi

if test "$os" = "darwin"; then
  $root_dir/mac/cli $db $max
else
  $root_dir/linux/cli $db $max
fi
