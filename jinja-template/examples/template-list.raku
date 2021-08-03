#!raku

use Sparrow6::DSL;

my %state = task-run ".", %(
  template => '
    {% for row in languages %}
      {{ row }}
    {% endfor %}
  ',
  variables => %(
    languages => [
      'Raku',
      'Python',
      'Perl',
      'Ruby'
    ]
  )
);
say %state.perl;

