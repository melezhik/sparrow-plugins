# SYNOPSIS

Deploy quadlet container.

# INSTALL

  $ s6 --install quadlet-container-deploy

# USAGE

## Cli

```
s6 --plg-run quadlet-container-deploy@name=my-app,version=0.1.2
```

## Raku

```raku
#!raku

task-run "app deploy", "quadlet-container-deploy", %(
  :name<my-app>,
  :version<0.1.3>,
);

```

# Parameters

## name

quadlet container template name

## version

application version

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
