#!raku

use Sparrow6::DSL;

task-run ".", %(
  command => 'echo $foo',
  #debug   => 1,
  envvars => %(
    foo => "BAR",
  ),
  expect_stdout => "BAR",
);


say "====";

task-run ".", %(
  command   => 'uptime',
  debug     => 0,
  expect_stdout => '^^ \d\d ":" \d\d \s'
);
