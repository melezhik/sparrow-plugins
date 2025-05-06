# SYNOPSIS

Sparrow plugin to print ec2 instance info in human readable format.

# INSTALL

```
s6 --install aws-show-instance
```

# USAGE

Cli:

```
s6 --plg-run aws-show-instance@id=bla_bla_blae
```

Raku:

```
task-run "bla instance", "aws-show-instance", %(
    id  => "bla-bla-bla"
);
```
# Author

Alexey Melezhik

# See also

* aws-run-instance - sparrow plugin to run ec2 instances ( optionally with some tags attached )

# Prerequisites

Aws cli should be installed

