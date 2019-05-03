# SYNOPSIS

Sparrow plugin to list tagged ec2 instances in human readable format.


# INSTALL

    $ s6 --install aws-list-tag-instances


# USAGE

To dump your tagged ec2 instances in human readable format just run:


    $ sparrow plg run  aws-list-tag-instances --param tag_key=foo --param tag_value=bar

Or by using sparrow task:

    $ sparrow project create aws 
    $ sparrow task add aws my-instances aws-list-tag-instances
    $ sparrow task ini  aws/my-instances

    ---
    tag_key: foo
    tag_value: bar


# Author

Alexey Melezhik


# See also

[aws-run-instance ](https://sparrowhub.org/info/aws-run-instance) - sparrow plugin to run ec2 instances ( optionally with some tags attached )

# Prerequisites

Aws cli should be installed

