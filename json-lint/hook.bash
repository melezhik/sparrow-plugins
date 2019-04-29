path=$(config path)

for f in $(ls $path/*.json); do
  run_story lint path $f 
done

for f in $(ls $path/*.js); do
  run_story lint path $f 
done
