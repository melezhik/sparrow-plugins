use Sparrow6::DSL;

my %state = task-run ".", %( 
  project => "test2"
);

for %state<list><> -> $r {
  say "name: {$r<name>}";
  say "id: {$r<id>}";
  say "default branch: {$r<defaultBranch>||'NA'}";
}
