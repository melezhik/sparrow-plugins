set -e

cd $(config dir)

echo "pwd:" `pwd`

echo "getting diff ..."

git diff --name-status $(config commit_old)..$(config commit_new)

git diff --name-status $(config commit_old)..$(config commit_new) > $cache_root_dir/git.data
