#!bash

files=$(config files)

touch $cache_root_dir/stat.txt

j=0

if test -z "$files"; then
  for i in $(git status --short | awk 'match($1, "M"){print $2}' |  grep -P '\.(yml|yaml)$'); do
    run_task linux/lint file $i out $cache_root_dir/stat.txt;
    let "j=j+1"
  done
  for i in $(git status --short | awk 'match($1, "A"){print $2}' |  grep -P '\.(yml|yaml)$'); do
    run_task linux/lint file $i out $cache_root_dir/stat.txt;
    let "j=j+1"
  done
else
  for i in $files; do
    run_task linux/lint file $i out $cache_root_dir/stat.txt;
    let "j=j+1"
  done
fi

echo "=====================" $cache_root_dir/stat.txt

echo "file processed: $j" >> $cache_root_dir/stat.txt


