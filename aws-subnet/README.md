# SYNOPSIS

Create aws subnet

# INSTALL

    $ s6 --install aws-subnet

## API

name: create-subnet
plugin: aws-subnet
config:
  sb_name: subn_01
  vpc_id: foobar
  cidr_block: 10.0.0.0/24

# Dependencies

aws cli

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

