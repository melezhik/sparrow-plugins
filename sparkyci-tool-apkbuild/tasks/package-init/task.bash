set -e

pkgname=$(config pkgname)

set -x

su - builder -c "cd /home/builder/ && mkdir -p raku-packages/$pkg_name"
