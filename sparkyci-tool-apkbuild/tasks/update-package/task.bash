set -e

pkgname=$(config pkgname)

if test -f "/home/builder/raku-packages/${pkgname}/APKBUILD.old"; then
  if diff -wbBt "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"; then
    echo "keep /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    su - builder -c "cd /home/builder/raku-packages/$pkgname && abuild -cKr"
  else
    echo "update /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"
    su - builder -c "cd /home/builder/raku-packages/$pkgname && abuild -c checksum && abuild -cr"
  fi
else
    echo "update /home/builder/raku-packages/${pkgname}/APKBUILD ..."
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD"
    cp -v "/home/builder/raku-packages/${pkgname}/APKBUILD.new" "/home/builder/raku-packages/${pkgname}/APKBUILD.old"
    su - builder -c "cd /home/builder/raku-packages/$pkgname && abuild -c checksum && abuild -cr"
fi

