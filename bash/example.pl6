#!perl6

use Sparrow6::DSL;

use Sparrow6::Runner;

Sparrow6::Runner::Api.new(
  root => "{$*CWD}",
  name  => "bash",
  do-test => True,
  show-test-result => True,
  debug => True,
  parameters => %(
    command => 'echo $foo',
    debug   => 1,
    envvars => %(
      foo => "BAR"
    )
  )
).task-run;


