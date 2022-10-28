set -e

file=$(config file)
target=$(config target)

echo "tar -czvf $file $target"

tar -czvf $file $target
