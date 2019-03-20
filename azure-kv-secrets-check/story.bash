#!bash

set -e

name=$(config name)

set -x

az keyvault secret list   --vault-name $name -o json | perl -MJSON -e '
  my $json = join "", <STDIN>;
  print join "\n", map {$_->{id}} @{JSON::decode_json($json)}
'

