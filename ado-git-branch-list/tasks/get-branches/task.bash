set -e

echo "==================================="
echo "lookup branches $(config repo) ..."

. ~/.sparrow-azure-devops.sh

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

curl  -s -L -D - $api/$(config project)/_apis/git/repositories/$(config repo)/refs?api-version=5.0  \
-H "Content-Type: application/json" \
-H "Authorization:  Basic $token_base64" \
-o $cache_root_dir/out.json | head -n 1

if test  "${SPARROW_ADO_DEBUG}" = "1"; then

  cat $cache_root_dir/out.json

fi

echo "data saved to [$cache_root_dir/out.json]"
