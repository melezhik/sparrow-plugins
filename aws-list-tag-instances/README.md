# SYNOPSIS

Sparrow plugin to list tagged ec2 instances in human readable format.

# INSTALL

```
s6 --install aws-list-tag-instances
```

# USAGE

Cli:

```
s6 --plg-run aws-list-tag-instances@tag_key=foo,tag_value=bar
```

Raku:

```
task-run "foo=bar instances", "aws-list-tag-instances", %(
    :tag_key<foo>,
    :tag_value<bar>,
);
```

# Author

Alexey Melezhik

# See also

aws-run-instance - sparrow plugin to run ec2 instances ( optionally with some tags attached )

# Prerequisites

Aws cli should be installed

