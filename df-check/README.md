# SYNOPSIS

elementary file system checks using df utility report 

# Dependencies

* df utility should be installed

# INSTALL

    s6 --install df-check

# USAGE

    s6 --plg-run df-check

    sparrow root: [/home/melezhik/sparrow]
    2018-12-08 22:09:59 : [plg] df-check [path] /
    STARTCHECK
    Файловая система        Размер Использовано  Дост Использовано% Cмонтировано в
    /dev/mapper/centos-root    50G         8,8G   42G           18% /
    devtmpfs                  7,6G            0  7,6G            0% /dev
    tmpfs                     7,6G          71M  7,6G            1% /dev/shm
    tmpfs                     7,6G          10M  7,6G            1% /run
    tmpfs                     7,6G            0  7,6G            0% /sys/fs/cgroup
    /dev/sda1                1014M         364M  651M           36% /boot
    /dev/mapper/centos-home   180G          91G   90G           51% /home
    tmpfs                     1,6G          56K  1,6G            1% /run/user/1000
    ENDCHECK
    ok  scenario succeeded
    threshhold: 80
    ok  text match /(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/
    ok  enough disk space (Дост%) on Файловая
    ok  enough disk space (18%) on /dev/mapper/centos-root
    ok  enough disk space (0%) on devtmpfs
    ok  enough disk space (1%) on tmpfs
    ok  enough disk space (1%) on tmpfs
    ok  enough disk space (0%) on tmpfs
    ok  enough disk space (36%) on /dev/sda1
    ok  enough disk space (51%) on /dev/mapper/centos-home
    ok  enough disk space (1%) on tmpfs
    STATUS  SUCCEED
        
# Plugin parameters

## threshold

Disk allowable used threshold as percentage ratio

    $ s6 --plg-run df-check@threshold=70

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)



