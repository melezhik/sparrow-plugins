#!raku

use Sparrow6::DSL;
  
task-run "run pod-weave", "raku-utils-pod-weave", %(
  args => [
    ["help"],
  ]
);
