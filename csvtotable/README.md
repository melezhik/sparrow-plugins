# SYNOPSIS

Wrapper for [csvtotable](https://github.com/vividvilla/csvtotable) utility.

# INSTALL

    $ s6 --install csvtotable

# USAGE

Cli:

    $ s6 --plg-run csvtotable@args=<args>

For example:

    $ s6 --plg-run csvtotable@args='/tmp/google.csv /tmp/google.html  --caption "my table"'


Raku:

    task-run "convert", "csvtotable", %(
      args => [
        "/tmp/goog.csv",
        "/tmp/goog.html",
        %(  caption => "my table", ),
      ]  
    )


# Author

- Csvtotable's author - [Vivek R](https://github.com/vividvilla)
- The plugin maintainer - Alexey Melezhik
