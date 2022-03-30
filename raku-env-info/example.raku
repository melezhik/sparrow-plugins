use Sparrow6::DSL;

my $s = task-run ".";

say "raku env: ", $s<raku>;
say "zef env: ", $s<zef>;

