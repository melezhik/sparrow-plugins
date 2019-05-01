#!bash
for i in `ls -1d *`; do if test -d $i && cd $i; then test -d .git && echo "git pull for $i" && git pull -q;  cd ../; fi ; done

