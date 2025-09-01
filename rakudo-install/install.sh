set -e
version=$1
curl https://rakubrew.org/install-on-perl.sh | sh
eval "$(~/.rakubrew/bin/rakubrew init Bash)"
rakubrew download $version
rakubrew switch $version
raku --version

if [[ -f ~/.bashrc.patched ]];
  echo "~/.bashrc already patched"
else
  echo "patching ~/.bashrc"
  echo 'eval "$(~/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bashrc
  touch ~/.bashrc.patched
fi

if [[ -f ~/.bash_profile.patched ]];
  echo "~/.bash_profile already patched"
else
  echo "patching ~/.bash_profile"
  echo 'eval "$(~/.rakubrew/bin/rakubrew init Bash)"' >> ~/.bash_profile
  touch ~/.bash_profile.patched
fi
