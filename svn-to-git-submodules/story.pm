use strict;
use File::Basename;

my $svn_repo = config()->{svn_repo};
my $outdir = config()->{outdir};

run_story('clear-cache') if config()->{clear_cache};
run_story('git-pull');

my $i;

open ( my $fh, '-|' , "svn list $svn_repo" ) or die $!;

while (my $d = <$fh>){

   chomp $d;

   next unless $d=~s{/$}[];

   if ( -f "/home/$ENV{USER}/svn-to-git-submodules/cache/$d") {
     set_stdout("$d already added");
   } else {
     run_story( 'submodule-add', { module_name => $d }) 
   }
   #last if $i++ > 5;
}

close $fh;



