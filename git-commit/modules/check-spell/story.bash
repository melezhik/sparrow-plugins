#!bash

#set -x
set -e

if test "`hunspell -d en_US -l ${cache_root_dir}/commit.msg`" == ""; then

  echo "no syntax errors in commit message"

else

  echo "syntax errors in commit message"

  exit 1

fi


