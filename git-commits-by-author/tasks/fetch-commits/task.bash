set -x
set -e


git shortlog -sne --no-merges > $cache_dir/stat.txt

cat $cache_dir/stat.txt
