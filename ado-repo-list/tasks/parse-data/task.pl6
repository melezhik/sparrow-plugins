use JSON::Tiny;
use Data::Dump;

my %data =from-json("{cache_root_dir()}/out.json".IO.slurp);

update_state(%( list => %data<value><>.sort({.<name> }) ));

for %data<value><>.sort({.<name> }) -> $i {

  say "{$i<name>} id=[{$i<id>}]"

}
