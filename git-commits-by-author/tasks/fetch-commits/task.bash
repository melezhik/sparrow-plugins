set -x
set -e


git shortlog -sne --no-merges > $root_dir/stat.txt

cat $root_dir/stat.txt
