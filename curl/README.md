# SYNOPSIS

Simple wrapper for `curl`.

# INSTALL

    $ s6 --install curl

# USAGE

DSL

    task-run "utils/curl", "curl", %(
      args => [
        %( 
          :output</dev/null>,
          :dump-header('-'),
        ),
        [
          'silent',
          'fail',
          'location'
        ],
        'http://raku.org'
      ]
    );

# Authors

* [Alexey Melezhik](https://github.com/melezhik/)
