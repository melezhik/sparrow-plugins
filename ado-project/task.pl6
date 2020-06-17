use JSON::Tiny;

my %data =from-json("{cache_root_dir()}/out.json".IO.slurp);

update_state(%data);

say "project ID: {%data<id>||'NA'}";
say "project URL: {%data<url>||'NA'}";
