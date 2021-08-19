use Sparrow6::DSL;

task-run ".", %(
  task => "pip-uninstall-from-req",
  req_path => "examples/requirements.txt",
  pip_options => "--verbose"
);
