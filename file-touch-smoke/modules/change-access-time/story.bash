rm -rf /tmp/new.txt || exit 1
touch /tmp/new.txt || exit 1

stat /tmp/new.txt

echo -n access time before ' '
stat -c %X /tmp/new.txt

echo -n modification time before ' '
stat -c %Y /tmp/new.txt


perl -MFile::stat -MFile::Touch -e '
    my $curr_acc_time = stat(qq{/tmp/new.txt})->atime;
    File::Touch->new( 
    atime_only => 1 , 
    time => ( $curr_acc_time + 30 ), # 30 seconds 
  )->touch(qw{/tmp/new.txt} )
'

echo 
echo ------
echo 

stat /tmp/new.txt

echo -n access time after ' '
stat -c %X /tmp/new.txt

echo -n modification time after ' '
stat -c %Y /tmp/new.txt
