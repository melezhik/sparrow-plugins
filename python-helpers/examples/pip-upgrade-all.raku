use Sparrow6::DSL;

task-run ".", %(
  task => "pip-upgrade-all",
);
