set -e

. ~/.sparrow-azure-devops.sh

cp -v $task_dir/template.json $cache_dir/request.json

project=$(config project)
repo=$(config repo)
branch=$(config branch)

perl -i -p -e "s/%branch%/$branch/g; s/%object_id%/$object_id/" $cache_dir/request.json

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')


if test  "${SPARROW_ADO_DEBUG}" = "1"; then

  cat $cache_dir/request.json

fi

curl -s -L -D - $api/$project/_apis/git/repositories/$repo/refs?api-version=4.1  -o /dev/null \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
--data-binary  @$cache_dir/request.json | head -n 2
