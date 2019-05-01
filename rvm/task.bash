#!bash

set -e

ruby_version=$(config ruby_version)

if test "${os}" = "debian" || "${os}" = "ubuntu"; then
  DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq gnupg2
fi

if perl -e "qq{$os}=~/centos/ and exit; exit 1" 2>/dev/null; then
  sudo yum -y -q install gnupg2
fi

curl -ksSL https://rvm.io/mpapis.asc | gpg2 --import -

source ~/.rvm/scripts/rvm

rvm reload

rvm install $ruby_version --default

