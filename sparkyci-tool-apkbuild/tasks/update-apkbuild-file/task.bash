set -e

pkgname=$(config pkgname)

if diff -wq "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"; then
  echo "keep /home/builder/raku-packages/${pkgname}/APKBUILD ..."
else
  echo "update /home/builder/raku-packages/${pkgname}/APKBUILD ..."
  cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"
fi

