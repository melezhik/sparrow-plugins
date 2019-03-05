use JSON;

my $basedir = story_var("basedir");
my $c = story_var("c");

my $file = "$basedir/$c.json";

open(my $fh, $file) or die "$!";

#set_stdout "processing $file ...";

my $s = join "", <$fh>;

close $fh;

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

    set_stdout("add file $i->{name} ...");

    push @{$state->{files}}, $i->{"name"};

  }

}

update_state($state);


