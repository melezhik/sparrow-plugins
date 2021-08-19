use Sparrow6::DSL;

task-run ".", %(
  task => "clean-cache",
  dir => [ "{%*ENV<HOME>}/.local", '/tmp/foo/' ]
);
