set -e

pkgname=$(config pkgname)

set -x

su - builder -c "cd /home/builder/ && mkdir -p raku-packages/$pkgname && cd raku-packages/$pkgname; if abuild -c verify; then :; else abuild checksum && abuild -cr; fi;"
