my $apk-str = "{root_dir()}/APKBUILD".IO.slurp;

$apk-str.subst("%license%",config()<license>);

"{cache_root_dir()}/APKBUILD".IO.spurt($apk-str);
