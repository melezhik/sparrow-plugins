use Sparrow6::DSL;

my $s = task-run ".", %(
  foo => "Hello"
);

say "message: ", $s<state><Message>;
