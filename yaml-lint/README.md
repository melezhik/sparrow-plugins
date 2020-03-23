# SYNOPSIS

Lint yaml files.

Whenever you change your yaml files in git, lint them through yaml python module.

It's convenient tool when you edit yaml files as yaml format is kinda fragile and easy to break.

Yaml lint picks up all the git `A` or `M` files and run yaml linter for them.

# INSTALL

    $ s6 --install yaml-lint

# USAGE

Cli

    # one file, using python YAML module  
    $ s6 --plg-run yaml-lint@files=config.yaml

    #  many files, using python YAML module  
    $ s6 --plg-run yaml-lint@files="config.yaml config2.,yaml"

    #  many files, using perl YAML::XS module  
    $ s6 --plg-run yaml-lint@files="config.yaml config2.,yaml",use_python=False

API

    # Lint files that modified in terms of git
    task-run "lint git modified files", "yaml-lint";

    # Lint files by path unconditionally

    # Linux version
    task-run "lint these files", "yaml-lint", %(
      files => "file.yaml file2.yaml file3.yaml"
    );

    # Windows version
    task-run "lint these files", "yaml-lint", %(
      files => ( 'file.yaml', 'file2.yaml', 'file3.yaml' )
    );

# Requirements

## Windows

None

## Linux

* python - yaml python module
* perl - YAML::XS perl module

# Author

Alexey Melezhik

