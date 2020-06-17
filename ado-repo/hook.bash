set -e

. ~/.sparrow-azure-devops.sh

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl -s -L -D - $api/$(config project)/_apis/git/repositories/$(config repo)?api-version=5.0  \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
-o $cache_root_dir/out.json

set_stdout "[$cache_root_dir/out.json]"
