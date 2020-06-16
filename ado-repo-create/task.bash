set -e

. ~/.sparrow-azure-devops.sh

cp -v $task_dir/template.json $cache_dir/request.json

repo=$(config repo)
project_id=$(config project_id)

perl -i -p -e "s/%repo%/$repo/g; s/%project_id%/$project_id/g;" $cache_dir/request.json

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl -f -s -L -D - $api/_apis/git/repositories?api-version=5.0  -o /dev/null \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
--data-binary  @$cache_dir/request.json 
