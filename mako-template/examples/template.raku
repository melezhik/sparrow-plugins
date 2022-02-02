#!raku

use Sparrow6::DSL;

my %state = task-run ".", %(
  template => '
    hello ${language}
  ',
  variables => %(
    language => "Python"
  )
);

say %state.perl;

