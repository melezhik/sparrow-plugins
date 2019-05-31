# SYNOPSIS

Sparrow plugin to show `CPUUtilization` for ec2 instance.

# INSTALL

    $ s6 --install aws-cw-cpu

# USAGE

To get CPU load for the last 2 weeks with daily granularity:

    $ s6 --plg-run aws-cw-cpu@instance_id=$instance-id,range='2 weeks'


The same instance, for the last 10 days:

    $ s6 --plg-run aws-cw-cpu@instance_id=$instance-id,range='10 days'

# Parameters

## range

Should be in format of: `$N weeks|days|hours`


# Output example:

![report](https://raw.githubusercontent.com/melezhik/aws-cw-cpu/master/cw.png)

# Author

Alexey Melezhik

# Prerequisites

Aws cli should be installed

