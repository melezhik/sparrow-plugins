my $apk-str = "{root_dir()}/APKBUILD".IO.slurp;

my $target_dir = "/home/builder/raku-packages/{config()<pkgname>}";

$apk-str.=subst("%license%",config()<license>);

"{$target_dir}/APKBUILD".IO.spurt($apk-str);

