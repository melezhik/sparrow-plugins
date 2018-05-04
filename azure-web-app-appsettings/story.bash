set -e

app_service=$(config app_service)

group=$(config group)

echo "AppService: ${app_service}"
echo "ResourceGroup: ${group}"
echo "==============================================="

az webapp config appsettings list  -n "${app_service}"  -g  "${group}"
