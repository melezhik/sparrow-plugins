set -e

pkgname=$(config pkgname)

set -x

su - builder -c "cd /home/builder/ && mkdir -p raku-packages/$pkgname && cd raku-packages/$pkgname && abuild checksum && abuild -r"
su - builder -c 'abuild-sign /home/builder/packages/raku-packages/x86_64/APKINDEX.tar.gz'
