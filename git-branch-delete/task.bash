branch=$(config branch)

echo "removing branch $branch"

set -x

git push --delete origin $branch
git branch -D $branch


