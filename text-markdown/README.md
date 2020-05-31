# SYNOPSIS

Convert markdown to html using CPAN module Text::Markdown.


# INSTALL

    $ s6 --install text-markdown

# USAGE

Cli:

    $ s6 --plg-run text-markdown@file=Readme.md

API:


```
my %state =  task-run "readme html", "text-markdown", %(
  file => "README.md"
);

say %state<html>;
```

# Plugin settings

## file

Path to file with markdown

# See also

[Text-Markdown](https://metacpan.org/release/Text-Markdown)

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)

