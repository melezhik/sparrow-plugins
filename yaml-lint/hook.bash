#!bash

files=$(config files)

if test -z "$files"; then\
  for i in $(git status --porcelain | awk 'match($1, "M"){print $2}'); do 
    run_story lint file $i; 
  done
else
  for i in $files; do 
    run_story lint file $i; 
  done
fi

