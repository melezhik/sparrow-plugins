set_spl %( dev-get-remote-files => 'https://github.com/Spigell/get-remote-files' );

my $dest_file = '/tmp/test.tar.gz';


file-delete "$dest_file";

task-run "some files", 'dev-get-remote-files', %(
  target      => 'https://sparrowhub.org/plugins/get-remote-files-v1.000001.tar.gz',
  destination => "$dest_file",
  make_backup => 'true'
);

bash "ls -alht $dest_file";




file-delete "$dest_file";

task-run "some files2", 'dev-get-remote-files', %(
  file1 => %(
    target      => 'https://sparrowhub.org/plugins/get-remote-files-v1.000001.tar.gz',
    destination => "$dest_file",
  ),
);
bash "ls -alht $dest_file";
