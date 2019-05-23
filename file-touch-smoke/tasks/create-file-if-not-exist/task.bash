rm -rf /tmp/new.txt || exit 1;
perl -MFile::Touch -e 'touch(qw{/tmp/new.txt})'
ls -l /tmp/new.txt
