export cache_root_dir

if test -e $cache_root_dir/hello; then
  $cache_root_dir/hello
else
  ./hello
fi
