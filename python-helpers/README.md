# python-helpers

Python helpers. 

# warning

Some logic and code taken from an original ohmyzshell plugin, but adapted to Sparrow plugin.

# install

    $ s6 --install python-helpers

# usage

    task-run "clean-cache", "python-helpers", %(
      task => "clean-cache",
    );
  
# parameters

## task

* `clean-cache`

Deletes byte-code and cache files from a list of directories or the current one.

## dir

Raku Array. List of directories.

For example:

    task-run "clean-cache", "python-helpers", %(
      task => "clean-cache",
      dir => [ "{%*ENV<HOME>}/.local", '/tmp/foo/' ]
    );

# See also

[ohmyzsh plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins)

# Author

Alexey Melezhik


