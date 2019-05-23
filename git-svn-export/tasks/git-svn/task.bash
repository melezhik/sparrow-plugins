
COLUMNS=80
LINES=24

local_dir=$(config local_dir)
svn_repo=$(config svn_repo)

p=$(task_var project)

echo export data from $svn_repo/$p

cd $local_dir || exit 1
git svn clone -q $svn_repo/$p 1>/dev/null 2>/dev/null
echo "svn clone -q $svn_repo/$p ok"

cd $local_dir/$p || exit 1

git checkout git-svn || exit 1
r_svn=`git log -1 --format=short` || exit 1

git checkout master || exit 1
git pull || exit 1
r_master=`git log -1 --format=short` || exit 1

echo
echo ---------
echo master  branch latest revision: 
echo ---------
echo $r_master
echo ---------
echo

echo
echo git-svn branch latest revision: 
echo ---------
echo $r_svn
echo ---------
echo

if test "${r_master}" != "${r_svn}"; then
  echo project $svn_repo/$p - master rev differs from git-svn revision - cannot export changes from svn
  echo use should start using Git, not Svn for further project development 
  exit 1
fi

cd $local_dir/$p || exit 1
git svn fetch -q 1>/dev/null 2>/dev/null || exit 1
echo "git svn fetch ok"

cd $local_dir/$p || exit 1

cd $local_dir/$p
git svn fetch -q 1>/dev/null 2>/dev/null 
git svn rebase -q 1>/dev/null 2>/dev/null || exit 1
echo "git svn rebase ok"

git branch -a -v --list || exit 1
