# SYNOPSIS

Sparrow plugin to show `CPUUtilization` for ec2 instance.

# INSTALL

    $ s6 --install aws-cw-cpu

# USAGE

To get CPU load for the last 2 weeks with daily granularity:

    $ sparrow plg run  aws-cw-cpu --param instance_id=$instance-id --param range='2 weeks'


The same instance, for the last 10 days:

    $ sparrow plg run  aws-cw-cpu --param instance_id=$instance-id --param range='10 days'

# Parameters

## range

Should be in format of: `$N weeks|days|hours`


# Output example:

![report](https://raw.githubusercontent.com/melezhik/aws-cw-cpu/master/cw.png)

# Author

Alexey Melezhik

# Prerequisites

Aws cli should be installed

