#!bash

use_python=$(config use_python)

echo "check $file ..."

if test $use_python = "True"; then

  if python3 --version 2>&1 1>/dev/null; then
    py_cmd=python3
  elif python --version 2>&1 1>/dev/null; then
    py_cmd=python
  else
    echo "neither python nor python3 found"
    exit
  fi
  if $py_cmd -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $file; then
    echo "$file [OK]" >> $out
  else
    echo "$file [FAIL]" >> $out
  fi

else


  if perl -MYAML::XS -e 'my $yaml = join "", <STDIN>; Load($yaml);' < $file; then
    echo "$file [OK]" >> $out
  else
    echo "$file [FAIL]" >> $out
  fi

fi

