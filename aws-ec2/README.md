# SYNOPSIS

Create/get aws ec2 instance 

# INSTALL

```
s6 --install aws-ec2
```

# Usage

## Create instance

```
task-run "create ec2", "aws-ec2", %(
  :action<create>,
  :name<node0>,
  :image<ami-0e322da50e0e90e21>,
  :type<t2.micro>,
  :subnet_id<foobarbaz>,
);
```

### Get instance

```
my $data = task-run "get ec2", "aws-ec2", %(
  :action<get>,
  :name<node0>,
);

say $data<id>;
```

# Dependencies

* aws cli

* yq

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
