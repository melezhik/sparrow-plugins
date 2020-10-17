# SYNOPSIS

Wrapper for [jinjalint](https://github.com/motet-a/jinjalint)

# INSTALL

    $ s6 --install jinjalint

# USAGE

    task-run "lint my code", "jinjalint", %(
      args => [
        "template-directory/",
        [ "verbose" ]
      ]
    );

# Args

See [jinjalint](https://github.com/motet-a/jinjalint)  documentation.

# Author

Alexey Melezhik

