run_task "install";

update_state(%(
  dir =>  "/home/{config()<user>}/.agents/{config()<agent>}", 
  command =>  "./run.sh"
));
