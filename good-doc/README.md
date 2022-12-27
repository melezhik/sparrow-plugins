# SYNOPSIS

Execute code snippets found in README file

# INSTALL

    $ s6 --install good-doc

# USAGE

In SparrowCI pipeline:

```yaml
  ok
  plugin: good-doc
```

The plugin will search for the first block of Raku code snippet inside README
file and execute it. That is it. This very first version does not
anything more.

# Paramteres

## path

Path to README file. Optional. Default value is "README.md"

# Author

Alexey Melezhik

