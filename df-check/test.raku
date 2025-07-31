use Sparrow6::DSL;

my $s = task-run ".", %(
  :!fail-on-check
);


die "some disks are full" if $s<err-cnt>;
