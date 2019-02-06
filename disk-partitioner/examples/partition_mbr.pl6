set_spl (dev-disk-partitioner => 'https://github.com/Spigell/disk-partitioner.git');

my $disk = '/dev/sdb';

bash "dd if=/dev/zero of=$disk bs=512 count=1 conv=notrunc";

task_run 'create gpt table force', 'dev-disk-partitioner', %(
  table => %(
    type => 'mbr',
    target => "$disk",
    recreate => 'true'
  ),
);

task_run 'simple creatione partition', 'dev-disk-partitioner', %(
  partition => %(
    target => "$disk",
    start  => '2M',
    end    => '100M',
  ),
);

bash "sudo parted $disk print", %(
  expect_stdout => 'primary'
);

task_run 'extented', 'dev-disk-partitioner', %(
  partition => %(
    type => 'extended',
    target => "$disk",
    start  => '400M',
    end    => '2000M',
  ),
);
bash "sudo parted $disk print", %(
  expect_stdout => 'extended'
);

task_run 'make boot partition on logical', 'dev-disk-partitioner', %(
  partition => %(
    type => 'logical',
    target => "$disk",
    fs     => %(
      type => 'ext4',
      ),
    start  => '700M',
    end    => '1500M',
    flags  => ( 'boot', 'lvm' )
  ),
);

bash "sudo parted $disk print", %(
  expect_stdout => ' boot '
);
