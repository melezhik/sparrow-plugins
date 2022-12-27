set -e

cd $dir

cat $file

rakudo_version=$(config rakudo_version)

if ! test -z $rakudo_version; then
 eval "$(rakudo-moar-$rakudo_version-01-linux-x86_64-gcc/scripts/set-env.sh)"
 raku --version 
fi

echo "run raku -I lib $file ..."

raku -I lib $file || echo "error: $!"
