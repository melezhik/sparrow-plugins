path=$(config path)

for f in $(ls $path/*.json); do
  run_task lint path $f 
done

for f in $(ls $path/*.js); do
  run_task lint path $f 
done
