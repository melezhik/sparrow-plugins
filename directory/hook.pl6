#!perl6

my $action = config()<action>;

if os() eq 'windows' {
  run_task("windows/$action")
} else {
  run_task("linux/$action")
}
