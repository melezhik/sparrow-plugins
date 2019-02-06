set_spl (dev-disk-partitioner => 'https://github.com/Spigell/disk-partitioner.git');

my $disk = '/dev/sdb';

bash "dd if=/dev/zero of=$disk bs=512 count=1 conv=notrunc";

task_run 'create table', 'dev-disk-partitioner', %(
  table => %(
    type => 'dos',
    target => "$disk",
  ),
);
task_run 'try to create table once more', 'dev-disk-partitioner', %(
  table => %(
    type => 'gpt',
    target => "$disk",
  ),
);

task_run 'create gpt table force', 'dev-disk-partitioner', %(
  table => %(
    type => 'gpt',
    target => "$disk",
    recreate => 'true'
  ),
);
