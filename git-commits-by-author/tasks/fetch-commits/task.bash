set -x
set -e

pwd

git shortlog -sne --no-merges HEAD > $cache_dir/stat.txt

cat $cache_dir/stat.txt
