use Sparrow6::DSL;

my $s = task-run ".";

say "sha: ", $s<sha>;
say "comment: ", $s<comment>;

