#!bash

#set -e

echo "clean python cache from dir: [$dir]";

for d in $dir; do

  echo "handle dir [$d]"

  find $d -type f -name "*.py[co]" -delete
  find $d -type d -name "__pycache__" -delete
  find $d -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
  find $d -depth -type d -name ".pytest_cache" -exec rm -r "{}" +

done


