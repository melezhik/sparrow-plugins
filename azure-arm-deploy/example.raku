use Sparrow6::DSL;

task-run ".", %(
   group => "assmt-dev",
   template => "bicep/appservice.bicep",
   parameters => {
     webSiteName => { value => "appraku111" },
     appServicePlanName => { value => "assmt-dev" },
   },
   mode => "create" # default value
);


