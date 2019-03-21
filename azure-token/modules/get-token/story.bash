#!bash

set -e

curl -s -f -L -X POST https://login.microsoftonline.com/$tenant_id/oauth2/token \
-d resource=https://management.azure.com \
-d client_id=$client_id \
-d grant_type=client_credentials \
-d response_type=token \
-d client_secret=$client_secret > $output

cat $output

