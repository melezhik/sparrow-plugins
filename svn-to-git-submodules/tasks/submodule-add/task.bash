set -x

set -e

mkdir -p ~/svn-to-git-submodules/cache

module_name=$(task_var module_name)
git_repo=$(config git_repo)
local_dir=$(config outdir)
postfix=$(config postfix)

cd $local_dir

git submodule add $git_repo/$module_name$postfix.git $module_name 

git commit -a -m "add new submodule $module_name"

touch ~/svn-to-git-submodules/cache/$module_name


