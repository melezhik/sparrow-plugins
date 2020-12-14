set -e

repo=$(config repo)

set -x

cwd=$PWD

echo > $root_dir/list.txt

if test $os = "darwin"; then
  gh_cli="gh"
else
  gh_cli=$root_dir/tasks/bin/gh
fi

for i in $repo; do

  echo "[$i open PR]" >> $root_dir/list.txt
  echo "=================" >> $root_dir/list.txt

  if test -d $i; then
    cd $i
    $gh_cli pr list --state=$state >> $root_dir/list.txt
    cd $cwd
  else
    $gh_cli pr list --state=$state --repo $i >> $root_dir/list.txt
  fi

  echo >> $root_dir/list.txt


done

cat $root_dir/list.txt

