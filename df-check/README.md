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
12:41:55 :: [task] - run plg df-check@mnt=/
12:41:55 :: [task] - run [df-check], thing: df-check@mnt=/
[task run: task.bash - df-check]
[task stdout]
12:41:55 :: Filesystem      Size  Used Avail Use% Mounted on
12:41:55 :: tmpfs           2.4G  1.6M  2.4G   1% /run
12:41:55 :: /dev/sda1        45G   33G   13G  74% /
12:41:55 :: tmpfs            12G     0   12G   0% /dev/shm
12:41:55 :: tmpfs           5.0M     0  5.0M   0% /run/lock
12:41:55 :: efivarfs        256K   14K  243K   6% /sys/firmware/efi/efivars
12:41:55 :: tmpfs            12G  180K   12G   1% /run/qemu
12:41:55 :: /dev/sda15       98M  6.3M   92M   7% /boot/efi
12:41:55 :: tmpfs           2.4G  4.0K  2.4G   1% /run/user/1001
[task check]
# validate disks capacity
stdout match <(\S+) \s+ (\S+) \s+ (\S+) \s+ (\S+) \s+ (\d+) \% \s+ (\S+)> True
# check disks, mount: /, threshold: 80
<enough disk space (74%) on /> True
```

# Plugin parameters

## threshold

Allowable disk usage threshold as percentage ratio:

    $ s6 --plg-run df-check@threshold=70 # check if disk is full on no more then 70 percents

## mnt

Check certain mount:

    s6 --task-run df-check@mnt=/,threshold=50

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)
