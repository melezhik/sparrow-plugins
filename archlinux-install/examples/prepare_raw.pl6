my $disk = '/dev/sda';
package-install ( 'dosfstools' );
 

task_run 'create gpt table force', 'disk-partitioner', %(
  table => %(
    type => 'gpt',
    target => "$disk",
    recreate => 'true'
  )
);

task_run 'make main xfs', 'disk-partitioner', %(
  partition => %(
    type => 'primary',
    target => "$disk",
    fs     => %(
      type => 'xfs'
    ),
  start  => '2Mib',
  end    => '9Gib',
    ),
  );
 
task_run 'make boot partition', 'disk-partitioner', %(
  partition => %(
    target => "$disk",
    fs     => %(
      type => 'fat32',
      ),
    start  => '9Gib',
    end    => '9513Mib',
    flags  => ( 'boot' )
  ),
);
