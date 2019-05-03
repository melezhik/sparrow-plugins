# SYNOPSIS

Lint yaml files.

Whenever you change your yaml files in git, lint them through yaml python module.

It's convenient tool when you edit yaml files as yaml format is kinda fragile and easy to break.

Yaml lint picks up all the git `A` or `M` files and run yaml linter for them.

# INSTALL

    $ s6 --install yaml-lint

# USAGE

Tomtit/Sparrowdo

    # Lint files that modified in terms of git

    task-run "lint git modified files", "yaml-lint";

    # Lint files by path

    task-run "lint these files", "yaml-lint", %(
      files => "file.yaml file2.yaml file3.yaml"
    );


# Requirements

* python
* yaml python module

# Author

Alexey Melezhik

