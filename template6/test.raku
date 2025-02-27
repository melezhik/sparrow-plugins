use Sparrow6::DSL;

my %state = task-run ".", %(
 vars => %(
  :name<alex8>,
 ),
 :target</tmp/out.txt>,
 :template_dir<examples>,
 :template<hello>,
 #:dry_run, 
);

say %state<status>;

my %state2 = task-run ".", %(
 vars => %(
  :name<alex10>,
 ),
 :target</tmp/out2.txt>,
 :content("Hello [% name %]"),
 #:dry_run, 
);

say %state<status>;

