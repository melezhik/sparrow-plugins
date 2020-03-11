# SYNOPSIS

Pre-commit hook - runs prove tests for Perl6 project 

# INSTALL

    $ s6 --install perl6-prove

# USAGE

You should set up .pre-commit-config.yaml at project root directory.

    $ cat .pre-commit-config.yaml
    -   repo: local
        hooks:
        -   id: perl6-prove
            name: perl6-prove
            entry: bash -c "s6 --plg-run perl6-prove@path=$PWD"
            language: system
            always_run: true
            files: ''
    

Follow pre-commit docs for details.

# Parameters

## path

Should be file path to a directory where your Perl6 project located. 
Usually this is the same directory where .pre-commit-config.yaml is located.
And not setting `path` should work for you.

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)


# See also
[pre-commit](https://github.com/pre-commit/pre-commit)
