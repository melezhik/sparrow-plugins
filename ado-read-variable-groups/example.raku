use Sparrow6::DSL;
use Data::Dump;

my %state = task-run ".", %(
  project => "assessment",
  name => "test",
  #only => ["test111"],
  debug => True
);


say Dump(%state);

