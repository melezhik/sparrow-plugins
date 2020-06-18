set -e

. ~/.sparrow-azure-devops.sh

cp -v $task_dir/template.json $cache_dir/request.json

project=$(config project)
repo=$(config repo)
branch=$(config branch)
old_object_id=$(config old_object_id)

perl -i -p -e "

  s/%branch%/$branch/g; 
  s/%old_object_id%/$old_object_id/g;
  s/%new_object_id%/$object_id/g;

" $cache_dir/request.json

if test  "${SPARROW_ADO_DEBUG}" = "1"; then

  cat $cache_dir/request.json

fi

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl  -s -L -D - -X POST $api/$project/_apis/git/repositories/$repo/refs?api-version=5.1  -o /dev/null \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
--data-binary  @$cache_dir/request.json | head -n 2

