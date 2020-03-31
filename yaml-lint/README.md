# SYNOPSIS

Lint yaml files. It's convenient tool when you edit yaml files as yaml format is kinda fragile and easy to break.

Whenever you change your yaml files in git, lint them.

Linter works in 2 modes:

* Picks up all files changed in Git (staged or locally modified - marked as `A` or `M`) and lint them
* Lints particular files ( see `files` parameter )

# INSTALL

    $ s6 --install yaml-lint

# USAGE

Cli

    # one file, using python YAML module  
    $ s6 --plg-run yaml-lint@files=config.yaml

    #  many files, using python YAML module  
    $ s6 --plg-run yaml-lint@files="config.yaml config2.yaml"

    #  many files, using perl YAML::XS module  
    $ s6 --plg-run yaml-lint@files="config.yaml config2.yaml",use_python=False

API

    # Lint files that modified in terms of git
    task-run "lint git modified files", "yaml-lint";

    # Lint files by path unconditionally

    # Linux version, using YAML::XS
    task-run "lint these files", "yaml-lint", %(
      files => "file.yaml file2.yaml file3.yaml",
      use_python => False
    );

    # Linux version, using wild cards
    task-run "lint these files", "yaml-lint", %(
      files => "path/to/dir/*.yaml",
      use_python => False
    );

    # Windows version
    task-run "lint these files", "yaml-lint", %(
      files => ( 'file.yaml', 'file2.yaml', 'file3.yaml' )
    );

Tomtit

    tom --profile yaml

# Requirements

## Windows

None

## Linux

* Python - yaml python module
* Perl - YAML::XS perl module

# Author

Alexey Melezhik

