# SYNOPSIS

Wrapper for [csvtotable](https://github.com/vividvilla/csvtotable) utility.


# INSTALL

    $ s6 --install csvtotable

# USAGE

Basic usage:

    $ s6 --plg-run -- <args>

For example:

    $ s6 --plg-run csvtotable -- /tmp/goog.csv /tmp/goog.html  --caption 'my table'


Run as sparrow task:

/csvtotable/README

/csvtotable/README

    $ s6 --task-set utils/csv-to-html

    ---
    args:
      - /tmp/goog.csv 
      - /tmp/goog.html
      - caption: my table


    $ s6 --task-run utils/csv-to-html


# Author

- Csvtotable's author - [Vivek R](https://github.com/vividvilla)
- The plugin maintainer - Alexey Melezhik
