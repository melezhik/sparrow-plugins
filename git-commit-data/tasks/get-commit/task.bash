cd $(config dir)

echo "get commit data from $(pwd) ..."

git show -s --format=%h > $cache_root_dir/sha.txt
git show -s --format=%s > $cache_root_dir/comment.txt
