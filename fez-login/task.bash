set -e

expect -f $root_dir/expect $(config user) $(config password)| perl -n -e 's/(Password:\s+).*/$1***********/; print'
