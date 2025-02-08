set -e

dr=$(config dry_run)
target=$(config target)
template=$(config template)

if test -f $target; then
  diff $cache_root_dir/$template.out $target || :
  if diff -q $cache_root_dir/$template.out $target; then
    echo "{ \"status\" : 0 }" > "$cache_root_dir/state.json"
  else
    echo "{ \"status\" : 2 }" > "$cache_root_dir/state.json"
  fi
else
  echo "create $target ..."
  cat $cache_root_dir/$template.out
  echo "{ \"status\" : 1 }" > "$cache_root_dir/state.json"
fi

echo "dry_run: $dr"

if test $dr = "True"; then
  echo "dry_run is on, exiting"
else
  cp -v $cache_root_dir/$template.out $target
fi
