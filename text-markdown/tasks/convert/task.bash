set -e

file=$(config file)

echo "convert $file, write to $cache_root_dir/out.html"

cat $file | Markdown.pl > $cache_root_dir/out.html

