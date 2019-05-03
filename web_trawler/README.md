# SYNOPSIS

Simple wrapper for `web_trawler`


# INSTALL

    $ s6 --install web_trawler

# USAGE

Basic usage:

    $ sparrow plg run web_trawler -- <args>

For example:

    $ sparrow plg run web_trawler -- http://google.com
    $ sparrow plg run web_trawler  --  --processes 2  http://sparrowhub.org

See parameters description at [https://gitlab.com/dlab-indecol/web_trawler](https://gitlab.com/dlab-indecol/web_trawler)

If you need some automation:

    $ sparrow project create utils

    $ sparrow task add utils google-non-web-data web_trawler

    $ sparrow task ini utils/google-non-web-dat

      args: 
        - --include_links_from_linked_pages 
        - --quiet 
        - google.com

    $ sparrow task run utils/google-non-web-data

# Author

* The author of main script is Gorm Roedder ( gormroedder_at_gmail.com )
* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



