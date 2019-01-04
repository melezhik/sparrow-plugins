set -e

url=$(config url)

if test "${url}"; then
  kv=`perl -e '$ARGV[0]=~/https:\/\/(\S+)\.vault\.azure\.net/; print $1' $url`  
  secret=`perl -e '$ARGV[0]=~/.*\/(\S+)/; print $1' $url`  
else
  kv=$(config kv)
  secret=$(config secret)
fi


az keyvault secret show --name "${secret}" --vault-name "${kv}" -o json > $cache_dir/kv.json

perl -Mstrict -MJSON -e '

  my $file = $ARGV[0];
  my $kv = $ARGV[1];
  my $secret = $ARGV[2];

  open my $fh, $file or die "cannot open file $file to read: $!";
  my $s = join "", <$fh>;
  close $fh;
  #print $s;

  my $data = decode_json($s);

  print "=========================\n";
  print "key vault: $kv\n";
  print "   secret: $secret\n"; 
  print "    value: $data->{value}\n";
  print "=========================\n";

' $cache_dir/kv.json $kv $secret
