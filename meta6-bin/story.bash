set -e
path=$(config path)
name=$(config name)
options=$(config options)

if test -d $path ; then
  echo cd to directory $path ...
else
  echo directory $path does not exist or not set
  exit 2;
fi

cd $path
set -x
meta6 --new-module=$name $options
set +x
