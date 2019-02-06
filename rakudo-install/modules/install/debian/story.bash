#!bash

set -e

export DEBIAN_FRONTEND=noninteractive
export PATH=/opt/rakudo-pkg/bin:$PATH

file=$(story_var file)
sudo dpkg -i ~/.rakudo-cache/$file

perl6 --version


