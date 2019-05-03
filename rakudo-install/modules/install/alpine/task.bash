#!bash

set -e

export PATH=/opt/rakudo-pkg/bin:$PATH

file=$(task_var file)

apk add --allow-untrusted ~/.rakudo-cache/$file

perl6 --version

apk version rakudo-pkg

apk info -e rakudo-pkg
