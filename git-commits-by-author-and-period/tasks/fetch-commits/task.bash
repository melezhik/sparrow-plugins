set -x

set -e

pwd

git shortlog -sne --since="$after" --before="$before" --no-merges HEAD > $cache_dir/stat.txt

cat $cache_dir/stat.txt
