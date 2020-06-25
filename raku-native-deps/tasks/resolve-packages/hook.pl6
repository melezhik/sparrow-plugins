my %state = get_state();

my @skip-list = config()<skip> || [];

for %state<list><> -> $i {
   
   if @skip-list.Set{$i<package>} {
      set_stdout("skip {$i.perl}");    
   } else {
      run_task "library-to-package", $i;
   }

}
