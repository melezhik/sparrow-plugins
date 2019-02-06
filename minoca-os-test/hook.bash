test=$(config test)

if test -z $test; then
  for s in $( ls -1 $project_root_dir/modules ); do
    run_story $s
  done
else
  run_story $test
fi


