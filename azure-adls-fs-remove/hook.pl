my $path = config()->{path};
my $dry_run = config()->{dry_run};

my $c = 1;

update_state({ files => [] , dirs => [ ] });

run_story("read-folder", { basedir =>  cache_dir(), path => $path, c => $c });

run_story("parse-folder-json", { basedir =>  cache_dir(), c => $c, dir => $path, remove_dir => 0  });

if ($dry_run) {

  set_stdout("would remove folder $path");

} else {

  run_story("remove-fs", { path => $path , ignore_errors => 0 })

}
