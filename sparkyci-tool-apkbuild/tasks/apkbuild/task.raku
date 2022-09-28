my $apk-str = "{root_dir()}/APKBUILD".IO.slurp;

my $target_dir = "/home/builder/raku-packages/{config()<pkgname>}";

$apk-str.=subst("%pkgname%",config()<pkgname>);
$apk-str.=subst("%pkgver%",config()<pkgver>);
$apk-str.=subst("%pkgrel%",config()<pkgrel>);
$apk-str.=subst("%pkgdesc%",config()<pkgdesc>);
$apk-str.=subst("%url%",config()<url>);
$apk-str.=subst("%license%",config()<license>);
$apk-str.=subst("%source%",config()<source>);
$apk-str.=subst("%depends%",config()<depends>);
$apk-str.=subst("%builddir%",config()<builddir>);
$apk-str.=subst("%extension%",config()<source_extension>);

"{$target_dir}/APKBUILD".IO.spurt($apk-str);

