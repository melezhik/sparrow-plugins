#!bash

adls=$(config adls)

set -e

echo "az dls fs delete --account $adls --path $path ..." >> delete.log

if az dls fs delete --account $adls --path $path 1>>delete.log 2>&1; then

  echo "$path removal [OK]"
  echo "$path removal [OK]" >> delete.log

else

  echo "$path removal [FAIL] - see delete.log for details"
  echo "$path removal [FAIL]" >> delete.log

  if test -z "${ignore_errors}"; then
    exit 2;
  fi

fi

