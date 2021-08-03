# jinja-template

Jinja templater

# Install

    s6 --install jinja-template

# Usage

    my %state = task-run "jt", "jinja-template", %(
      template => '
        hello {{ language }}
      ',
      variables => %(
        language => "Python"
      )
    );

    say %state.perl; # {:result("\n    hello Python\n  ")}

One can pass _any_ structures from Raku to Jinja, for example:

    my %state = task-run "jt", "jinja-template", %(
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

    say %state.perl; # {:result("\n    \n      Raku\n    \n      Python\n    \n      Perl\n    \n      Ruby\n    \n  ")}

# Author

Alexey Melezhik

