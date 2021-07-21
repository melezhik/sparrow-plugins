#!raku

use Sparrow6::DSL;

task-run ".", %(
  name => "airflow-flower",
  namespace => "airflow",
  command => qw{
    /usr/bin/dumb-init
    --
  }
);
