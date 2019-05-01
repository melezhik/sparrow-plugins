export PERL5LIB=$project_root_dir/local/lib/perl5:$PERL5LIB
export PATH=$project_root_dir/local/bin:$PATH

cd $(config path)
touch releaserc

release $(config options) && echo 'done!'



