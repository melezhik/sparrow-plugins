n=$(task_var n);
export line=$(task_var line);
sleep=$(config sleep);

if perl -e "$line=~/^(\\S+):\\s/ or $line=~/^$/ or exit 1"; then
  echo "[$n]" skip header line: $line
else
    export package=$(perl -e "$line=~/^(\\S+)\\s/ and print \$1")
    echo -n "[$n]" load meta info for $package "( https://fastapi.metacpan.org/v1/module/$package )" ... ' ';
  if curl -G -s -f https://fastapi.metacpan.org/v1/module/$package \
    -d 'fields=status,date' -o $test_root_dir/$package.json; then
    echo ok
    echo pasring $test_root_dir/$package.json ...
    cat $test_root_dir/$package.json | perl -MJSON -e '
      $d=decode_json(join "",<STDIN>); 
      print $ENV{package}, " ", $d->{status}'
  else
    echo fail
  fi
  sleep $sleep;

fi

