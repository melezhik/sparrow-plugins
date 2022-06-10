set -e

rakudo_version=$(config version)

set -x

2>&1


echo "installing rakudo packages on sparky"
echo "==================================="

sudo apk add wget zstd

wget --quiet --no-clobber --no-check-certificate https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk

sudo apk add --allow-untrusted glibc-2.31-r0.apk

sudo mkdir -p /data/whateverable/

cd /data/whateverable/ && sudo wget -q https://whateverable.6lang.org/$rakudo_version

sudo zstd -dqc -- $rakudo_version | sudo tar -x --absolute-names

/tmp/whateverable/rakudo-moar/$rakudo_version/bin/raku --version
