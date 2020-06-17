use JSON::Tiny;

my %data =from-json("{cache_root_dir()}/out.json".IO.slurp);

update_state(%data);

say "repo ID: {%data<id>}";
