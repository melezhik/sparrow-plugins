use JSON::Tiny;
use Data::Dump;

my %data = from-json("{cache_root_dir()}/out.json".IO.slurp);

my @data;

set_stdout("branches list\n=====================");

for %data<value><> -> $i {
  if $i<name> ~~ / 'refs/heads/' (\S+) / {
    push @data, "$0";
    set_stdout($0);
  }
}


update_state(%(list => @data));


