set -e

curl https://rakubrew.org/install-on-perl.sh | sh

eval "$(~/.rakubrew/bin/rakubrew init Bash)"

version=(config version)
version="moar-"$version

rakubrew download $version

rakubrew switch $version

raku --version


