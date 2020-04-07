set -x
set -e

cd $cache_dir
wget --quiet --no-clobber --no-check-certificate https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk
apk add --allow-untrusted glibc-2.31-r0.apk

