# SYNOPSIS

Sparrow plugin to run aws instance.


# INSTALL

    $ s6 --install aws-run-instance


# USAGE

To run instance you should set necessary 3 parameters:


    $ s6 --plg-run aws-run-instance@subnet=$subnet-id,image=$image-id,type=$instance-type

The command will return JSON data upon successfull instance creation. You'll grep instance ID for 
further work with instance.


Run as sparrow task.

It's convenient to run plugin as sparrow task providing sane defaults:

/aws-run-instance/README
/aws-run-instance/README
    $ s6 --task-set aws/run-instance

    ---
    image: ami-bla-bla-bla
    type: "t2.micro"
    subnet: subnet-bla-bla-bla


Setting tags.

To keep track of your instances you create with sparrow plugin you can use tag:


    $ s6 --plg-run aws-run-instance@tag_key=foo,tag_value=bar ...
 
Or by using sparrow task:

    $ s6 --task-set aws/run-instance
    ---
    tag_key: foo
    tag_value: bar
    # ... other parameters 

Setting key name

To set name of the key pair, use `key` parameter:

    $ s6 --plg-run aws-run-instance@key=SupportUser ...

Or by using sparrow task:


    $ s6 --task-set aws/run-instance
    ---
    key: SupportUser


More about key pair read at the aws doc pages - [http://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html](http://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)

# Assigning public IP

Set `associate_public_ip` to "on" if you want a public IP address to be assigned to the new instance in a VPC.

    $ s6 --task-set aws/run-instance
    ---
    associate_public_ip: on

# Adding one or more security group names

Set `sec_groups`

    $ s6 --task-set aws/run-instance
    ---
    sec_groups: sg-12345 sg-6789 sg-121344

# Author

Alexey Melezhik


# Prerequisites

Aws cli should be installed

