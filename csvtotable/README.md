# SYNOPSIS

Wrapper for [csvtotable](https://github.com/vividvilla/csvtotable) utility.


# INSTALL

    $ s6 --install csvtotable

# USAGE

Basic usage:

    $ sparrow plg run -- <args>

For example:

    $ sparrow plg run csvtotable -- /tmp/goog.csv /tmp/goog.html  --caption 'my table'


Run as sparrow task:

    $ sparrow project create utils 

    $ sparrow task add utils csv-to-html csvtotable

    $ sparrow task ini utils/csv-to-html

    ---
    args:
      - /tmp/goog.csv 
      - /tmp/goog.html
      - caption: my table


    $ sparrow task run utils/csv-to-html


# Author

- Csvtotable's author - [Vivek R](https://github.com/vividvilla)
- The plugin maintainer - Alexey Melezhik
