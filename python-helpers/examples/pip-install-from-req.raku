use Sparrow6::DSL;

task-run ".", %(
  task => "pip-install-from-req",
  req_path => "examples/requirements.txt",
  pip_options => "--verbose",
  pip => "pip"
);
