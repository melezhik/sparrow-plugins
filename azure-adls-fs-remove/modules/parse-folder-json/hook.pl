use JSON;

my $basedir = story_var("basedir");
my $c = story_var("c");
my $dir = story_var("dir");
my $dry_run = config()->{dry_run};

my $file = "$basedir/$c.json";

open(my $fh, $file) or die "$!";

my $s = join "", <$fh>;

close $fh;

unlink $file;

my $data = decode_json($s);

for my $i (@$data) {


  if ($i->{"type"} eq "DIRECTORY"){

    $c++;

    set_stdout("add dir $i->{name}");

    run_story("read-folder", { basedir =>  $basedir, path => $i->{name}, c => $c });    

    run_story("parse-folder-json", { basedir =>  $basedir, c => $c, dir => $i->{"name"} });
  
  }

  if ($i->{"type"} eq "FILE"){

    if ($dry_run) {

      set_stdout("would remove $i->{name}");

    } else {

      run_story("remove-fs", { path => $i->{name} });
    }


  }

}

run_story("remove-fs", { path => $dir });



