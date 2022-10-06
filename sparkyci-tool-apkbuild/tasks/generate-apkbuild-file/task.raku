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
if config()<makedepends> {
  $apk-str.=subst("%makedepends%"," {config()<makedepends>}") 
} else {
  $apk-str.=subst("%makedepends%","") 
}
if config()<buildcommand> {
  $apk-str.=subst("#%buildcommand%"," {config()<buildcommand>}") 
} else {
  $apk-str.=subst("#%buildcommand%","") 
}
$apk-str.=subst("%builddir%",config()<builddir>);
$apk-str.=subst("%extension%",config()<source_extension>);

say "generate {$target_dir}/APKBUILD.new";

"{$target_dir}/APKBUILD.new".IO.spurt($apk-str);
