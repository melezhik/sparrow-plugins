use Sparrow6::DSL;

task-run ".", %(
  :out</tmp/out.csv>,
  :by<age>
);
