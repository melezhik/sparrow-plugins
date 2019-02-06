set -e

project=$(config project)
directory=$(config directory)
debug=$(config debug)

echo working copy directory: $directory

cd $directory

if ! test -z $debug; then
  set -x
fi

git pull

if test -z $project; then
  git submodule sync
  git submodule update --init --recursive --remote
else
  echo updating $project ...
  git submodule sync $project
  git submodule update --init --remote $project
fi

