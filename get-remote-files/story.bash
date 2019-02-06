debug=$(config debug)

if [[ $debug ]]; then
  set -x
fi

make_backup_global=$(config main.make_backup)

if [[ -n $(config destination) ]]; then
  
  target=$(config target)
  destination=$(config destination)
  make_backup=$(config make_backup)
  main

else
  for c in {1..9}; do
    if [[ -n $(config file$c) ]]; then 
      target=$(config file$c.target)
      destination=$(config file$c.destination)
      make_backup=$(config file$c.make_backup)
	  main    
    fi
  done
fi
exit 0
