set -e

cd $dir

cat $file

rakudo_path=$(config rakudo_path)

if ! test -z $rakudo_path; then
  echo "Using rakudo from $rakudo_path:"
  eval "$($rakudo_path/scripts/set-env.sh --quiet)"
  raku --version
fi

echo "run raku -I lib $file ..."

timeout -t 600s -m 1000000k raku -I lib $file || echo "warn: good_doc failed"
