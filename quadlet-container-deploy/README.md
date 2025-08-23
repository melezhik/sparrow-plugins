# SYNOPSIS

Deploy quadlet container.

# INSTALL

  $ s6 --install quadlet-container-deploy

# USAGE

## Cli

```
s6 --plg-run quadlet-container-deploy@name=my-app,version=0.1.2,rootless
```

## Raku

```raku
#!raku

$s = task-run "app deploy", "quadlet-container-deploy", %(
  :name<my-app>,
  :version<0.1.3>,
);

say $s<changed>; # True|False

```

# Parameters

## name

quadlet container template name

## version

application version

## rootless

Boolean. Use rootless mode. Optional. Default is `False` 

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
