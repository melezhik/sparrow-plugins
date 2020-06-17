use JSON::Tiny;

my %data =from-json("{root_dir()}/out.json".IO.slurp);

update_state(%data);

say "repo ID: {%data<id>}";
