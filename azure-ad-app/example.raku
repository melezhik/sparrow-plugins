use Sparrow6::DSL;

my %s = task-run ".", %(
  displayName => "assmt-dev", # application registered displayName
);

say %s<appId>; # get appId

say %s.perl; # get other app properites as Raku Hash
