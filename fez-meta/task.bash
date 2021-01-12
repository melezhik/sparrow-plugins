set -e

expect -f $root_dir/expect "$(config name)" "$(config website)" "$(config email)"
