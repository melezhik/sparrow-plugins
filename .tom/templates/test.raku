#!raku

task-run "run [% bin %]", "[% name %]", %(
  args => [
    ["help"],
  ]
);
