# SYNOPSIS

Lint yaml files.

# INSTALL

    $ sparrow plg install yaml-lint

# USAGE

Tomtit/Sparrowdo

    # Lint files that modified in terms of git

    task-run "lint modified files", "yaml-lint";

    # Lint files by path

    task-run "lint these files", "yaml-lint", %(
      files => "file.yaml file2.yaml file3.yaml"
    );


# Requirements

* python
* yaml python module

# Author

Alexey Melezhik

