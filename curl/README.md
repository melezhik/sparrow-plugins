# SYNOPSIS

Simple wrapper for `curl`.


# INSTALL

    $ s6 --install curl

# USAGE

    $ s6 --task-set utils/curl

      task-run "utils/curl", "curl", %(
        args => [
          %( '-D' => '-' ), [ 'verbose', '-f', '-L' ], 'http://perl6.com'
        ]
      );
      
    $ s6 --task-run utils/curl

# Authors

* [Alexey Melezhik](https://github.com/melezhik/)



