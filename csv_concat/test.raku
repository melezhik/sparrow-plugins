use Sparrow6::DSL;

task-run ".", %(
  files => dir(test => /".csv"/).map({$_.path}).sort,
  out => "/tmp/out.csv"
);
