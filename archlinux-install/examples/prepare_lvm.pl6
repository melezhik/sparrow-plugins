my $disk = '/dev/sda';
 
bash "parted $disk mklabel gpt";
bash "parted $disk mkpart P1 2Mib 9Gib";
bash "parted $disk set 1 lvm on";
bash "parted $disk mkpart ESP fat32 9Gib 9513Mib";
bash "parted $disk set 2 boot on";
 
task-run "create main lv", "lvm", %(
  action    => 'create',
  partition => '/dev/sda1',
  vg        => 'vg_main',
  lv        => 'slashroot',
  size      => '7GB',
  fs        => %(
	type => 'xfs'
  ),
);

task-run "create home lv", "lvm", %(
  action    => 'create',
  recreate  => 'true',
  partition => '/dev/sda1',
  vg        => 'vg_main',
  lv        => 'home',
  size      => '100M',
  fs        => %(
	type => 'ext4'
  ),
);

task-run "create spigell lv", "lvm", %(
  action    => 'create',
  recreate  => 'true',
  partition => '/dev/sda1',
  vg        => 'vg_main',
  lv        => 'spigell',
  size      => '500MB',
  fs        => %(
	type => 'ext4'
  )
);
