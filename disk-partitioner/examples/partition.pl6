set_spl (dev-disk-partitioner => 'https://github.com/Spigell/disk-partitioner.git');

package-install ( 'dosfstools' );
my $disk = '/dev/sdb';

bash "dd if=/dev/zero of=$disk bs=512 count=1 conv=notrunc";

task_run 'create gpt table force', 'dev-disk-partitioner', %(
  table => %(
    type => 'gpt',
    target => "$disk",
    recreate => 'true'
  ),
);

task_run 'simple creation', 'dev-disk-partitioner', %(
  partition => %(
    target => "$disk",
    start  => '2M',
    end    => '100M',
  ),
);

bash "sudo parted $disk print", %(
  expect_stdout => 'primary'
);

task_run 'create ext4 partition', 'dev-disk-partitioner', %(
  partition => %(
    target => "$disk",
    fs     => %(
      type => 'ext4',
    ),
    start  => '200M',
    end    => '300M',
  ),
);
bash "sudo parted $disk print", %(
  expect_stdout => 'ext4'
);

task_run 'use xfs options', 'dev-disk-partitioner', %(
  partition => %(
    type => 'primary',
    target => "$disk",
    fs     => %(
      type => 'xfs',
      options => '-l logdev=/dev/sdb1,size=1000b'
      ),
    start  => '400M',
    end    => '500M',
  ),
);
bash "sudo parted $disk print", %(
  expect_stdout => 'xfs'
);

task_run 'set lvm mode', 'dev-disk-partitioner', %(
  partition => %(
    target => "$disk",
    start  => '600M',
    end    => '800M',
    flags  => ( 'lvm' )
  ),
);
bash "sudo parted $disk print", %(
  expect_stdout => 'lvm'
);
task_run 'make boot partition', 'dev-disk-partitioner', %(
  partition => %(
    type => 'ESP',
    target => "$disk",
    fs     => %(
      type => 'fat32',
      ),
    start  => '900M',
    end    => '1500M',
    flags  => ( 'boot' )
  ),
);

bash "sudo parted $disk print", %(
  expect_stdout => 'fat32'
);
