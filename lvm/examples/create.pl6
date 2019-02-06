my $disk = '/dev/sdb';

bash "sudo vgremove -f -y vg_test || exit 0";

bash "parted -s $disk mklabel gpt";
bash "parted -s $disk mkpart P1 2Mib 4Gib";

set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );
task-run "create test lv", "dev-lvm", %(
  action  => 'create',
  partition => "/dev/sdb1",
  vg      => 'vg_test',
  lv      => 'lv_test',
  size    => '100M',
);

task-run "create test lv force", "dev-lvm", %(
  recreate  => 'true',
  partition => "/dev/sdb1",
  vg        => 'vg_test',
  lv        => 'lv_test',
  size      => '200M',
  fs => %(
      type => 'ext4'
  ),
);

task-run "create test lv force", "dev-lvm", %(
  action  => 'create',
  partition => "/dev/sdb1",
  vg        => 'vg_test',
  lv        => 'lv_test',
  size      => '200M',
);
