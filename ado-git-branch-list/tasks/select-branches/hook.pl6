use JSON::Tiny;
use Data::Dump;

my %data = from-json("{cache_root_dir()}/out.json".IO.slurp);

my @data;

set_stdout("=====================");
set_stdout("branches list");
set_stdout("author=[{config()<author>||'ANY'}]");
set_stdout("skip=[{config()<skip>||'NA'}]");
set_stdout("=====================");

for %data<value><> -> $i {
  if $i<name> ~~ / 'refs/heads/' (\S+) / {

    my $name = "$0";

    if (config()<author>) {
      next unless $i<creator><uniqueName> eq config()<author>
    }

    if (config()<skip>) {
      my $pattern = /<{config()<skip>}>/;
      next if $name ~~ /$pattern/;
    }

    push @data, %( 
      project => config()<project>,
      repo => config()<repo>,
      name => $name, 
      author => $i<creator><uniqueName>
    );
    set_stdout("$name [$i<creator><uniqueName>]");
  }
}


update_state(%(list => @data));


