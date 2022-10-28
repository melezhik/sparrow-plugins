set -e

file=$(config file)
dir=$(config dir)

echo "tar -xzf $file "

tar -xzf $file

if test $dir; then
  ls -l $dir
fi

