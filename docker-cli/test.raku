use Sparrow6::DSL;

task-run ".", %(
  vault_path => "/sparrow/",
  vars => "foo bar baz",
  action => "run",
  name => "worker",
  image => "melezhik/sparrow:alpine",
  #dry_run => True,
);

