use Sparrow6::DSL;

my $s = task-run ".", %(
  dir => "../"
);

say "sha: ", $s<sha>;
say "comment: ", $s<comment>;

