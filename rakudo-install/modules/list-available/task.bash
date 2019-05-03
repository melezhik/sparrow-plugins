#!bash

set -e

search=$(config search)

set -x

curl -s -k -f https://github.com/nxadm/rakudo-pkg/releases | grep download/v | perl -n -e '/href="(.*?)"/ and print "https://github.com$1", "\n"' | grep -v sha1 | grep -i $search
