#!bash

set -e

export PATH=/opt/rakudo-pkg/bin:$PATH

file=$(story_var file)

rpm -Uvh ~/.rakudo-cache/$file

perl6 --version

