#!raku

use Sparrow6::DSL;
  
task-run "run [% bin %]", "[% name %]", %(
  args => [
    ["help"],
  ]
);
