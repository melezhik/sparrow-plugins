#!bash

path=$(config path)

if test -z $path; then

  for f in $(ls $PWD/*.json); do
    run_task lint path $f 
  done
  
  for f in $(ls $PWD/*.js); do
    run_task lint path $f 
  done
  
else

  for f in $(ls $path/*.json); do
    run_task lint path $f 
  done
  
  for f in $(ls $path/*.js); do
    run_task lint path $f 
  done
  
fi


