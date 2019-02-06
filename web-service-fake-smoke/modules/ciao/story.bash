WEBSERVICE_FAKE=$project_root_dir/wsf.yaml wsf get '/?name=sparrow' | \
perl -MJSON -e 'my $s = decode_json(join "", <STDIN>); 
print $s->{status},"\n",$s->{data}->{message}'
