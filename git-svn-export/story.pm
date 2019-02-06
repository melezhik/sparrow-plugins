use strict;
use File::Basename;

run_story('init');

my $local_dir = config()->{local_dir};
my $project = config()->{project};

open ( my $fh, '-|' , "find $local_dir -maxdepth 1 -mindepth 1 -type d | sort " ) or die $!;

while (my $d = <$fh>){
  my $p = basename($d); chomp $p;

  if ($project){
    next unless $project eq $p;
  }

   run_story( 'git-svn', { project =>  $p })

}

close $fh;


