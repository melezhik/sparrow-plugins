use JSON::Tiny;

my %data =from-json("{cache_root_dir()}/project.json".IO.slurp);

update_state(%data);

say "repo ID: {%data<id>||'NA'}";

if %data<id> {

  run_task "create-repo-api", %(
    project_id => %data<id>
  );

  set_stdout("project found");

} else {

  set_stdout(%data<message>);

}
