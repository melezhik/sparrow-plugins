#!bash

#set -x
set -e

if test "`hunspell -d en_US -l ${cache_root_dir}/commit.msg`" == ""; then

  echo "spellcheck ok"

else

  echo "spellcheck fails - syntax errors in commit message"

  exit 1

fi


