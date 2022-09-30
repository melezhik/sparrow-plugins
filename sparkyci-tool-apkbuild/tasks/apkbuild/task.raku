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


if "{$target_dir}/APKBUILD".IO ~~ :f {

  my $apk-old-str = "{$target_dir}/APKBUILD".IO.slurp;

  if $apk-old-str eq $apk-str {
    say "{$target_dir}/APKBUILD has not changed, keep it";
  } else {
    say "update {$target_dir}/APKBUILD";
    "{$target_dir}/APKBUILD".IO.spurt($apk-str);
  } 

} else {
  say "update {$target_dir}/APKBUILD";
  "{$target_dir}/APKBUILD".IO.spurt($apk-str);
}
