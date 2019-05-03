#!bash

echo "validate $path ...";

perl6 -MJSON::Tiny -e "from-json slurp('$path')";
