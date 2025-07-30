# SYNOPSIS

elementary file system checks using df utility report 

# Dependencies

* df utility should be installed

# INSTALL

    s6 --install df-check

# USAGE

    s6 --plg-run df-check

# Sample output

```
[task] :: run plg df-check
[task] :: run thing df-check
[df-check] :: Filesystem      Size  Used Avail Use% Mounted on
[df-check] :: udev            992M     0  992M   0% /dev
[df-check] :: tmpfs           200M   21M  180M  11% /run
[df-check] :: /dev/xvda1       25G  3.1G   22G  13% /
[df-check] :: tmpfs          1000M     0 1000M   0% /dev/shm
[df-check] :: tmpfs           5.0M     0  5.0M   0% /run/lock
[df-check] :: tmpfs          1000M     0 1000M   0% /sys/fs/cgroup
[df-check] :: tmpfs           200M     0  200M   0% /run/user/1000
[df-check] :: /dev/loop0       56M   56M     0 100% /snap/core18/1932
[df-check] :: /dev/loop4       29M   29M     0 100% /snap/amazon-ssm-agent/2333
[df-check] :: /dev/loop5       33M   33M     0 100% /snap/amazon-ssm-agent/2996
[df-check] :: /dev/loop1       98M   98M     0 100% /snap/core/10444
[df-check] :: /dev/loop2       56M   56M     0 100% /snap/core18/1944
[df-check] :: /dev/loop6       98M   98M     0 100% /snap/core/10577
[task check] stdout match (r) <(\S+) \s+ (\S+) \s+ (\S+) \s+ (\S+) \s+ (\S+)> True
[task check] threshhold: 80
[task check] <enough disk space (Use%) on Filesystem> True
[task check] <enough disk space (0%) on udev> True
[task check] <enough disk space (11%) on tmpfs> True
[task check] <enough disk space (13%) on /dev/xvda1> True
[task check] <enough disk space (0%) on tmpfs> True
[task check] <enough disk space (0%) on tmpfs> True
[task check] <enough disk space (0%) on tmpfs> True
[task check] <enough disk space (0%) on tmpfs> True
[task check] <enough disk space (100%) on /dev/loop0> False
[task check] <enough disk space (100%) on /dev/loop4> False
[task check] <enough disk space (100%) on /dev/loop5> False
[task check] <enough disk space (100%) on /dev/loop1> False
[task check] <enough disk space (100%) on /dev/loop2> False
[task check] <enough disk space (100%) on /dev/loop6> False
=================
TASK CHECK FAIL
```

# Plugin parameters

## threshold

Allowable disk usage threshold as percentage ratio:

    $ s6 --plg-run df-check@threshold=70 # check if disk is full on no more then 70 percents

## disk

Check certain disk:

    s6 --task-run df-check@disk=/dev/disk1s2,threshold=57

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
