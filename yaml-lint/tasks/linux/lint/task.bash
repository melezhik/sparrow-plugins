#!bash

use_python=$(config use_python)

#echo $use_python

if test $use_python = "True"; then

  echo "python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $file"

  python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $file

else

  echo -n "perl -MYAML::XS -e 'my $yaml = join \"\", <STDIN>; Load($yaml)' < $file"

  perl -MYAML::XS -e 'my $yaml = join "", <STDIN>; Load($yaml); print " ===> [OK]"' < $file

fi

