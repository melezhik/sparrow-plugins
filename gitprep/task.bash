set -e

gitprep_user=$(config gitprep_user)

if ! id $gitprep_user 2>/dev/null; then
  useradd -m --shell `which bash` $gitprep_user
fi

if ! test -f /home/$gitprep_user/gitprep-latest.tar.gz; then
  su -l -c 'curl -kL https://github.com/yuki-kimoto/gitprep/archive/latest.tar.gz \
  -o gitprep-latest.tar.gz' $gitprep_user
fi

if ! test -d /home/$gitprep_user/gitprep; then
  su -l -c 'tar xf gitprep-latest.tar.gz && mv gitprep-latest gitprep' $gitprep_user
fi

su -l -c 'cd gitprep && ./setup_module' $gitprep_user

su -l -c 'cd gitprep && prove t  ' $gitprep_user

su -l -c 'cd gitprep && ./setup_database' $gitprep_user

