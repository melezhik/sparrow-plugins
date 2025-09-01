set -e

version=$1

eval "$(~/.rakubrew/bin/rakubrew init Bash)" >/dev/null 2>&1  || :

if [[ rakubrew version 2>/dev/null ]]; then
  echo "rakubrew already installed"
else
  echo "installing rakubrew"
  curl https://rakubrew.org/install-on-perl.sh | sh
fi

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
