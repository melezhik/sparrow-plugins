# SYNOPSIS

Sparrow plugin to list tagged ec2 instances in human readable format.


# INSTALL

    $ s6 --install aws-list-tag-instances


# USAGE

To dump your tagged ec2 instances in human readable format just run:


    $ s6 --plg-run aws-list-tag-instances@tag_key=foo,tag_value=bar

Or by using sparrow task:

/aws-list-tag-instances/README
/aws-list-tag-instances/README
    $ s6 --task-set  aws/my-instances

    ---
    tag_key: foo
    tag_value: bar


# Author

Alexey Melezhik


# See also

[aws-run-instance ](https://sparrowhub.org/info/aws-run-instance) - sparrow plugin to run ec2 instances ( optionally with some tags attached )

# Prerequisites

Aws cli should be installed

