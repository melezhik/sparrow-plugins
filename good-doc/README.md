# SYNOPSIS

Verify that documentation is good enough:

* It contains at least one piece of (Raku) code

* This piece of code is executed without errors

# Current state

The plugin will search for the first block of Raku code snippet inside README
file and execute it. 

That is it. 

This very first version does not do anything more.

# INSTALL

    $ s6 --install good-doc

# USAGE

In SparrowCI pipeline:

```yaml
tasks:
  -
    name: good-doc
    plugin: good-doc
    config: 
      path: source/README.md
```

# Parameters

## path

Path to README file. Optional. Default value is "README.md"

## rakudo_path

Use rakudo from file path, this should be rakudobrew path. Optional. 

Example:

```yaml
  rakudo_path: "{{ CWD }}/rakudo-moar-2022.07-01-linux-x86_64-gcc"
```

# Author

Alexey Melezhik

