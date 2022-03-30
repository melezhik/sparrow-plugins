cd $(config dir)

echo "get commit data from $(pwd) ..."

git show -s --format=%h > $cache_root_dir/sha.txt
git log --oneline -n 1 > $cache_root_dir/comment.txt
