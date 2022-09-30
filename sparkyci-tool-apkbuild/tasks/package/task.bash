set -e

pkgname=$(config pkgname)

set -x

su - builder -c "cd /home/builder/ && mkdir -p raku-packages/$pkgname && cd raku-packages/$pkgname && abuild verify || abuild checksum"
su - builder -c "cd /home/builder/ && mkdir -p raku-packages/$pkgname && cd raku-packages/$pkgname && abuild -Kcr"
