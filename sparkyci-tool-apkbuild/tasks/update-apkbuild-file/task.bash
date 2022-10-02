set -e

pkgname=$(config pkgname)

if test -f "/home/builder/raku-packages/${pkgname}/APKBUILD.old"; then
  if diff -wt "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"; then
    echo "keep /home/builder/raku-packages/${pkgname}/APKBUILD ..."
  else
    echo "update /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"
    echo "update checksum for /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    su - builder -c "cd /home/builder/raku-packages/$pkgname && abuild -c checksum"
  fi
else
    echo "update /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"
    echo "update checksum for /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    su - builder -c "cd /home/builder/raku-packages/$pkgname && abuild -c checksum"
fi

