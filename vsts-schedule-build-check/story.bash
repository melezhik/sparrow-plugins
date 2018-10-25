#!bash

set -e

pattern=$(config pattern)
scheduled_only=$(config scheduled_only)

dir=$(config dir)

if test "${dir}"; then
  cd $dir
fi


if test "${scheduled_only}" = "on"; then
  echo "check scheduled builds for pattern ${pattern} ..."
  vsts build list | grep "${pattern}"|grep schedule
else
  echo "check all builds for pattern ${pattern} ..."
  vsts build list | grep "${pattern}"
fi
