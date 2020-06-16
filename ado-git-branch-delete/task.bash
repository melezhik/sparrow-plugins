set -e

. ~/.sparrow-azure-devops.sh

repo=$(config repo)
project=$(config project)
branch=$(config branch)

token_base64=$(echo -n $user:$token|base64|perl -n -e 's/\n//; print')

#curl  -s -L -D - -X DELETE $api/$project/_apis/git/favorites/refs/?api-version=5.0  -o /dev/null \
#-H "Content-Type: application/json" \
#-H "Authorization:  Basic $token_base64" \
#--data-binary  @$cache_dir/request.json | head -n 2

