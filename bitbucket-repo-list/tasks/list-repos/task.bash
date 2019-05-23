set -e
login=$(config login)
password=$(config password)
project=$(config project)
team=$(config team)
pagelen=$(config pagelen)
page=$(task_var page)

curl -s -f -G https://api.bitbucket.org/2.0/repositories/$team \
-d q="project.key=\"${project}\"" \
-d page=$page -u $login:$password \
-d pagelen=$pagelen | perl -MJSON -e '
  use strict;
  my $data = join "", (<STDIN>); 
  my $h = decode_json($data);
  #warn $data->{};
  print "continue: ",  ( $h->{next} ? "true" :  "false" ), "\n";
  print "next: ", $h->{next}, "\n";
  for my $v (@{$h->{values}}){
    print "repo: $v->{name}\n";
  }

'

