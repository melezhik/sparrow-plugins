use JSON::Tiny;
use Data::Dump;

my %data = from-json("{cache_root_dir()}/out.json".IO.slurp);

my @data;

set_stdout("branches list\n=====================");

for %data<value><> -> $i {
  if $i<name> ~~ / 'refs/heads/' (\S+) / {
  
    if (config()<author>) {
      next unless $i<creator><uniqueName> eq config()<author>
    }

    push @data, %( name => "$0", author => $i<creator><uniqueName> );
    set_stdout("{$0} [$i<creator><uniqueName>]");
  }
}


update_state(%(list => @data));


