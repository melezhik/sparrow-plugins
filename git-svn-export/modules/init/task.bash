local_dir=$(config local_dir)
svn_repo=$(config svn_repo)
project=$(config project)
skip_init=$(config skip_init)

echo svn_repo: $svn_repo
echo local_dir: $local_dir
echo

test -d $local_dir || mkdir -p $local_dir

if test -z $skip_init; then

  echo 'initialaze local_dir ... '

  echo 'updating project list from svn_repo ...'

  for i in $(svn list $svn_repo| grep '/'); do
    mkdir -p $local_dir/$i
  done

else

  echo 'skip initialazation stage ...'

fi

echo 'init done'

echo
echo
echo
