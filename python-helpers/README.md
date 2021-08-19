# python-helpers

Python helpers for daily work.

# warning

Some logic and code taken from original ohmyzshell plugins, but adapted to Sparrow.

# install

    $ s6 --install python-helpers

# usage

    task-run "clean-cache", "python-helpers", %(
      task => "clean-cache",
    );
  
# parameters

## task

Sets task to run.

* `clean-cache`

Deletes byte-code and cache files from a list of directories or the current one.

* `set-user-paths`

Generates a command to add --user site-packages to PYTHONPATH, for all installed python versions.

* `pip-upgrade-all`

Update all installed packages.

For system wide installation override `pip_options`:

    task-run "update", "python-helpers", %(
      task => "pip-upgrade-all",
      pip_options => ""
    );

* `pip-install-from-req`

Install packages from requirements.txt file.

You can also override `pip_options`:

    task-run "inst-from-req", "python-helpers", %(
      task => "pip-install-from-req",
      pip_options => "--verbose"
    );

* `pip-uninstall-from-req`

Uninstall packages from requirements.txt file.

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

