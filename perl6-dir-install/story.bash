#!bash
for i in `ls -l1d *`; do if cd $i; then test -f META6.json && zef install . --force-install;  cd ../; fi ; done

