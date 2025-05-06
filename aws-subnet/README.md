# SYNOPSIS

Create/get aws subnet

# INSTALL

```
s6 --install aws-subnet
```

## API

### Create

```
task-run "create subnet", "aws-subnet", %(
  :action<create>,
  :sb_name<subn_01>,
  :vpc_id<foobar>,
  cidr_block => "10.0.0.0/24",
);
```

### Get

```
my $data = task-run "subn_01", "aws-subnet", %(
  :action<get>,
  :sb_name<subn_01>,
);
say $data<sn-id>; # subnet ID
```

# Dependencies

* aws cli
* yq

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

