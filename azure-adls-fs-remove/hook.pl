my $path = config()->{path};

my $c = 1;

run_story("read-folder", { output =>  cache_dir()."/$c.json", path => $path });
