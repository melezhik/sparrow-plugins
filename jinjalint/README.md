# SYNOPSIS

Wrapper for [jinja2-lint](https://github.com/drm/jinja2-lint)

# INSTALL

    $ s6 --install jinjalint

# USAGE

    task-run "lint my code", "jinjalint", %(
      args => [
        "template-directory/*.j2",
      ]
    );

# Args

See [jinja2-lint](https://github.com/drm/jinja2-lint) documentation.

# Author

Alexey Melezhik

