# SYNOPSIS

Create/get aws ec2 instance 

# INSTALL

    $ s6 --install aws-ec2

## API

### Create

```yaml
name: create-ec2
plugin: aws-ec2
config:
  action: create
  name: host_01
  type: t2.micro
  subnet_id: foobarbaz
  image: ami-0e322da50e0e90e21
```

### Get

```yaml
name: get-ec2 
plugin: aws-ec2
config:
  action: get
  name: host_01
```

State:

```yaml
  id: $instance_id

```

# Dependencies

* aws cli

* yq

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
