# SYNOPSIS

Simple wrapper for `web_trawler`


# INSTALL

    $ s6 --install web_trawler

# USAGE

Cli:

    $ s6 --plg-run web_trawler <args>

For example:

    $ s6 --plg-run web_trawler@args=http://google.com
    $ s6 --plg-run web_trawler@args="--processes 2  https://raku.org"

See parameters description at [https://gitlab.com/dlab-indecol/web_trawler](https://gitlab.com/dlab-indecol/web_trawler)

API:

    task-run "download raku.org", "web_trawler", %(
      args => [
        [ 
          'include_links_from_linked_pages',
          'quiet'
        ],
        "raku.org"
      ]
    );

# Author

* The author of main script is Gorm Roedder ( gormroedder_at_gmail.com )
* The plugin maintainer is [Alexey Melezhik](https://github.com/melezhik/)



