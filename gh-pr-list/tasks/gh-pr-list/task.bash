set -e

repo=$(config repo)

set -x

cwd=$PWD

echo > $root_dir/list.txt

for i in $repo; do

  cd $i

  echo "[$i open PR]" >> $root_dir/list.txt

  echo "=================" >> $root_dir/list.txt

  gh pr list --state=$state >> $root_dir/list.txt

  echo >> $root_dir/list.txt

  cd $cwd

done

cat $root_dir/list.txt

