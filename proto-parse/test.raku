use Sparrow6::DSL;

my $st = task-run ".", %(
  :file<examples/user.proto>,
);

say $st<list><>.raku;

say "===";

task-run ".", %(
  :file<examples/user.proto>,
  :action<dump>,
  :type<UserCreateRequest>,
);

