use Sparrow6::DSL;

task-run ".", %(
   group => "assmt-dev",
   template => "bicep/appservice.bicep",
   parameters => {
     sku => { value => "P1v2" },
     webSiteName => { value => "appraku111" },
     appServicePlanName => { value => "assmt-dev" },
     linuxFxVersion => { value => "PYTHON|3.9" }
   },
   #mode => "create" # default value
   mode => "validate",
   verbose => True
);


