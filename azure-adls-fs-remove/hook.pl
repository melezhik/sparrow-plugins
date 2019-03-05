use JSON;

my $path = config()->{path};

my $c = 1;

update_state({ files => [] , dirs => [$path] });

run_story("read-folder", { basedir =>  cache_dir(), path => $path, c => $c });

run_story("parse-folder-json", { basedir =>  cache_dir(), c => $c });

run_story("remove-files");

run_story("remove-folders");
