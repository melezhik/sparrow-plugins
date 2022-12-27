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
  plugin: good-doc
```

# Parameters

## path

Path to README file. Optional. Default value is "README.md"

# Author

Alexey Melezhik

