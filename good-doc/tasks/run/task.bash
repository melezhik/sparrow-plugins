set -e

cd $dir

cat $file

echo "run raku -I lib $file ..."

raku -I lib $file || echo "error: $!"
