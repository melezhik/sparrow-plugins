use Sparrow6::DSL;

task-run "dump type", "proto-parser", %(
  :file<examples/user.proto>,
  :action<dump>,
  :type<UserCreateRequest>,
);
