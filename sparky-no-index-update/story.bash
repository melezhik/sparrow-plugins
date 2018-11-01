#!bash
set -e

dir=$(config dir)

cd $dir

set -x

find $dir -name sparky.yaml -exec perl -i -p -e 's/no_index_update:\s+false/no_index_update: true/' {} \;
