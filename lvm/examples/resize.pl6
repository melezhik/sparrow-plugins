set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );

my $disk = '/dev/sdb';

bash "sudo vgremove -f -y vg_test || exit 0";

bash "parted -s $disk mklabel gpt";
bash "parted -s $disk mkpart primary 2Mib 4Gib";

task-run "create test lv", "dev-lvm", %(
  partition => '/dev/sdb1',
  vg      => 'vg_test',
  lv      => 'lv_test_resize',
  size    => '50M',
  fs      => %(
    type   => 'ext4'
  ),
);

task-run "create test lv", "dev-lvm", %(
  action  => 'resize',
  vg      => 'vg_test',
  lv      => 'lv_test_resize',
  size    => '60M',
);

task-run "create test lv", "dev-lvm", %(
  action  => 'resize',
  vg      => 'vg_test',
  lv      => 'lv_test_resize',
  add    => '60M',
  resize-fs => 'false'
);

bash 'lvs | grep lv_test_resize';

task-run "create test lv", "dev-lvm", %(
  action  => 'resize',
  vg      => 'vg_test',
  lv      => 'lv_test_resize',
  reduce    => '20M',
  resize-fs => 'true',
);

bash 'lvs | grep lv_test_resize';
