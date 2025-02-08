use Sparrow6::DSL;

my %state = task-run ".", %(
 vars => %(
  :name<alex2>,
 ),
 :target</tmp/out.txt>,
 :template_dir<examples>,
 :template<hello>,
 #:dry_run, 
);

say %state<status>;
