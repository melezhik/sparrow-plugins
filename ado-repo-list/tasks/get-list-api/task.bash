set -e

. ~/.sparrow-azure-devops.sh

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl -s -L -D - $api/$(config project)/_apis/git/repositories/?api-version=5.0  \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
-o $cache_root_dir/out.json | head -n 1

echo "save data to [$cache_root_dir/out.json]"
