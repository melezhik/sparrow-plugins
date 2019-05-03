#!bash
for i in `ls -1d *`; do if test -d $i && cd $i; then test -f META6.json && zef install . --force-install;  cd ../; fi ; done

