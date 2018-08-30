#!bash

set -e;

export vault_name=$(config vault_name)
export cert_name=$(config cert_name)
echo "==================================================="
az keyvault certificate show  --vault-name $vault_name -n $cert_name -o json | \
perl -MJSON -Mstrict -e '
  my $json = join "", <STDIN>;
  my $data = decode_json($json);
  print "Vault Name:\t\t", $ENV{vault_name}, "\n";
  print "Cert Name:\t\t", $ENV{cert_name}, "\n";
  print "x509ThumbprintHex:\t", $data->{x509ThumbprintHex}, "\n";
  print "Expires:\t\t", $data->{attributes}->{expires}, "\n";
  print "dnsNames:\t\t", join " ", @{$data->{policy}->{'x509CertificateProperties'}->{subjectAlternativeNames}->{dnsNames}}, "\n";
  
'
echo "==================================================="
