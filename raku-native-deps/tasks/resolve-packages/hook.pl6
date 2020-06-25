my %state = get_state();

for %state<list><> -> $i {
   run_task "library-to-package", $i;
}
