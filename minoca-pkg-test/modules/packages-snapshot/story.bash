set -x
set -e
opkg list-installed > $test_root_dir/installed.txt
ls -l $test_root_dir/installed.txt
