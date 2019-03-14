use JSON;

my $basedir = story_var("basedir");
my $c = story_var("c");
my $dry_run = config()->{dry_run};

my $file = "$basedir/$c.json";

open(my $fh, $file) or die "$!";

#set_stdout "processing $file ...";

my $s = join "", <$fh>;

close $fh;

unlink $file;

my $data = decode_json($s);
my $state = get_state();

#use Data::Dumper;

#set_stdout(Dumper($data));

for my $i (@$data) {


  if ($i->{"type"} eq "DIRECTORY"){

    $c++;

    #set_stdout("[$c] ".($i->{"name"}). "...");

    set_stdout("add dir $i->{name} ...");

    push @{$state->{dirs}}, $i->{"name"};

    run_story("read-folder", { basedir =>  $basedir, path => $i->{name}, c => $c });    

    run_story("parse-folder-json", { basedir =>  $basedir, c => $c });
  
  }

  if ($i->{"type"} eq "FILE"){

    if ($dry_run) {

      set_stdout("would remove $i->{name}");

    } else {

      run_story("remove-fs", { path => $i->{name} });
    }


  }

}

update_state($state);


