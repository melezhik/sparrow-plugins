# SYNOPSIS

Outthentic plugin.

Manage your partitions via sparrow/sparrowdo.

# INSTALL

    $ sparrow plg install disk-partitioner

# USAGE

## via Sparrowdo

This example shows how to make table, create one empty partition and one xfs partition with external log.

    $ cat sparrowfile
    
    task_run 'create gpt table force', 'disk-partitioner', %(
      table => %(
        type => 'gpt',
        target => "/dev/sdb",
        recreate => 'true'
      )
    );

    task_run 'simple creation', 'dev-disk-partitioner', %(
      partition => %(
        target => "/dev/sdb",
        start  => '2M',
        end    => '100M'
      )
    );

    task_run 'using xfs options', 'disk-partitioner', %(
      partition => %(
        type => 'primary',
        target => "/dev/sdb",
        fs     => %(
          type => 'xfs',
          options => '-l logdev=/dev/sdb1,size=1000b'
        ),
      start  => '400M',
      end    => '500M',
        ),
      );

# Parameters
## table part
### target
Your disk. ( e.g. /dev/sdX )

### type
Choose type of table. See all in [parted documentation](https://www.gnu.org/software/parted/manual/html_node/mklabel.html). 

Also for msdos there are aliases: `mbr` and `dos`.

### recreate
Make new one disk's table despite an existing one.

## partition part
### target
Your disk. ( e.g. /dev/sdX )

### type
Type of partition. Default is `primary`. Types:
 - primary
 - extended
 - logical
 - ESP

### start
Start of partition.

### end
End of partition.

### flags
Set flags for the partition. One can set multiple flags. 

May be a string or a array.

### fs
Hash of parameters:
 - type

Desired filesystem for creation. 

*Note* for fat filesystem you must install `dosfstools`.

 - fs_option

Option for creation of filesystem.

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)

[parted](https://www.gnu.org/software/parted/manual/parted.html)

