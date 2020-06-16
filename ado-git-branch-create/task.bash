set -e

. ~/.sparrow-azure-devops.sh

cp -v $task_dir/template.json $cache_dir/request.json

repo=$(config repo)
project=$(config project)
branch=$(config branch)
path=$(config path)
old_object_id=$(config old_object_id)

perl -i -p -e "

  s/%content%/dummy data/g; 
  s/%branch%/$branch/g; 
  s/%path%/$path/g;
  s/%old_object_id%/$old_object_id/g;

" $cache_dir/request.json

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl  -s -L -D - -X POST $api/$project/_apis/git/repositories/$repo/pushes?api-version=5.0  -o /dev/null \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
--data-binary  @$cache_dir/request.json | head -n 2

