# SYNOPSIS

Create/get aws subnet

# INSTALL

    $ s6 --install aws-subnet

## API

### Create

```yaml
name: create-subnet
plugin: aws-subnet
config:
  action: create
  sb_name: subn_01
  vpc_id: foobar
  cidr_block: 10.0.0.0/24
```

### Get

```yaml
name: get-subnet
plugin: aws-subnet
config:
  action: get
  sb_name: subn_01
```

State:

```yaml
  sn-id: $subnet_id

```

# Dependencies

* aws cli
* yq

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

