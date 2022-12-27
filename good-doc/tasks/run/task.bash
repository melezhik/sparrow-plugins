set -x

set -e

cd $dir

raku -I lib $file || echo "error: $!"
