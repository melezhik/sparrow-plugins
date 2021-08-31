#!raku

use Sparrow6::DSL;

my %data = task-run ".", %(
  name => %*ENV<node>,
  #annotations => [
  #  "machine.openshift.io/cluster-api-delete-machine"
  #]
  annotations => %(
    "machine.openshift.io/cluster-api-delete-machine" => ""
  ),
  labels => %(
    "kubernetes.io/os" => "linux"
  )
);

say %data.keys.perl;

say %data<spec><providerID>; 
