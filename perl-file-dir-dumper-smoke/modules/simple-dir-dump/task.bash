rm -rf /tmo/foo || exit 1

mkdir -p /tmp/foo/bar || exit 1

ls -l /tmp/foo

echo running File::Dir::Dumper::App against /tmp/foo ...

perl -MFile::Dir::Dumper::App -e 'exit(File::Dir::Dumper::App->new({argv => \@ARGV})->run)' /tmp/foo/
