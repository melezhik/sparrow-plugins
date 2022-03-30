use Sparrow6::DSL;

my %state = task-run ".", %(
  CN => "www.example1000.com"
);

say %state<key>; # private key
say %state<cert>; # certificate
