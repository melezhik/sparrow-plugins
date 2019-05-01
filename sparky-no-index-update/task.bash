#!bash
set -e

dir=$(config dir)
action=$(config action)

cd $dir

set -x

if test "${action}" = "enable"; then
  find $dir -name sparky.yaml -exec perl -i -p -e 's/no_index_update:\s+false/no_index_update: false/' {} \;
else
  find $dir -name sparky.yaml -exec perl -i -p -e 's/no_index_update:\s+false/no_index_update: true/' {} \;
fi
