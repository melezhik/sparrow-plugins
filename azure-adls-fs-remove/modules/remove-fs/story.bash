#!bash

adls=$(config adls)

set -e

echo "az dls fs delete --account $adls --path $path ..." >> delete.log

if az dls fs delete --account $adls --path $path 1>>delete.log 2>&1; then
  echo "$path removal [OK]"
else
  echo "$path removal [FAIL] - see delete.log for details"

  if test -z "${ignore_errors}"; then
    exit 2;
  fi

fi

