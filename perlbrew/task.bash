\curl -L http://install.perlbrew.pl | bash

if grep 'source' ~/.bashrc | grep -q '~/perl5/perlbrew/etc/bashrc'; then
:
else
  echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.bashrc
fi

source ~/perl5/perlbrew/etc/bashrc

which perlbrew


