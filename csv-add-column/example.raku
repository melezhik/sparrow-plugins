use Sparrow6::DSL;

task-run ".", %( 
  :in<example.csv>,
  :out</tmp/out.csv>,
  :data<1234>,
);


say "/tmp/out.csv".IO.slurp;
