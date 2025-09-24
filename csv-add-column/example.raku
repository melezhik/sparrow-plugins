use Sparrow6::DSL;

task-run ".", %( 
  :in<example.csv>,
  :out</tmp/out.csv>,
  :date<123>,
);
