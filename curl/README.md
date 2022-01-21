# SYNOPSIS

Simple wrapper for `curl`.

# INSTALL

    $ s6 --install curl

# USAGE

DSL

    task-run "utils/curl", "curl", %(
      args => [
        %( 
          '-D' => '-',
          'output' => '/dev/null'
        ),
        [
          'silent',
          '-f',
          'location'
        ],
        'http://raku.org'
      ]
    );

# Authors

* [Alexey Melezhik](https://github.com/melezhik/)



