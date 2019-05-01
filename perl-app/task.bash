
app_dir=$(config app_dir)

app_user=$(config app_user)

app_source_url=$(config app_source_url)

app_script=$(config app_script)

git_branch=$(config git_branch)

http_port=$(config http_port)

sudo useradd -m --shell `which bash` $app_user

sudo cpanm -q Ubic Ubic::Service::Plack || exit 1
sudo cpanm -q Starman || exit 1

sudo mkdir -p $app_dir
sudo chown $app_user $app_dir

sudo ubic-admin setup --batch-mode --quiet
sudo ubic stop perl-app

if test -d $app_dir/.git; then
  #set -x;
  su --shell `which bash` --login -c "cd $app_dir && git checkout $git_branch && git pull && carton install --deployment" \
  $app_user || exit 1
else
  #set -x;
  su --shell `which bash` --login -c "git clone --branch $git_branch $app_source_url $app_dir \
  && cd $app_dir && carton install --deployment" $app_user || exit 1
fi


sudo mkdir -p  /etc/ubic/service/

cat << EOF > /tmp/dancer_app.ubic.conf  

use parent qw(Ubic::Service::Plack);
 
# if your application is not installed in @INC path:
sub start {
    my \$self = shift;
    \$ENV{PERL5LIB} = "$app_dir/local/lib/perl5";
    \$self->SUPER::start(@_);
}
 
__PACKAGE__->new(
    server => 'Starman',
    app => "$app_dir/$app_script",
    port => $http_port,
    user => "$app_user",
    stdout   => "$app_dir/stdout.log",
    stderr   => "$app_dir/stderr.log",
);

EOF

sudo cp /tmp/dancer_app.ubic.conf /etc/ubic/service/perl-app

sudo ubic start perl-app

sudo ubic status perl-app && echo install-ok

