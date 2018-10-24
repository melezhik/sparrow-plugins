set -e

pattern=$(config pattern)

dir=$(config dir)

if test "${dir}"; then
  cd $dir
fi

set -x

vsts build list | grep "${pattern}"|grep schedule
