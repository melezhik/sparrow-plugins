set -e
set -x

app_service=$(cofnig app_service)

group=$(cofnig group)

az webapp config appsettings list  -n "${app_service}"  -g  "${group}"
