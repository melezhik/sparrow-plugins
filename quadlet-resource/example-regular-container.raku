use Sparrow6::DSL;

my $s = task-run ".", %(
  :type<timer>, 
  :!templated,
  :description<Container Deploy Timer>,
  :name<container-deploy>,
  :requires<container-deploy.service>,
  :on_boot_sec<5min>,
  :on_unit_active_sec<3min>,
  :randomized_delay_sec<1min>,
  :accuracy_sec<2min>,
  :rootless,
);

say $s<changed>;

