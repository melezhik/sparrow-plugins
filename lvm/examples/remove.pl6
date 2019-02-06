set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );
my $disk = '/dev/sdb';
my $partition = '/dev/sdb1';
my $vg = 'vg_test';

bash "sudo vgremove -f -y $vg || exit 0";

bash "parted -s $disk mklabel gpt";
bash "parted -s $disk mkpart primary 2Mib 4Gib";

task-run "create test lv", "dev-lvm", %(
  action  => 'create',
  vg      => "$vg",
  lv      => 'lv_test_delete_plz',
  size    => '50M',
  partition => "$partition",
);
task-run "remove main lv", "dev-lvm", %(
  action  => 'remove',
  vg      => "$vg",
  lv      => 'lv_test_delete_plz',
  force   => 'yes',
);

task-run "double remove delete lv", "dev-lvm", %(
  action  => 'remove',
  vg      => "$vg",
  lv      => 'lv_test_delete_plz',
  force   => 'yes',
);
