#!bash

password=$(config password)
app_reg=$(config app_reg)
subs=$(config subs)
tenant=$(config tenant)

echo "az login --service-principal -u $app_reg  --tenant $tenant -p $password"

set -e

az login --service-principal -u $app_reg  --tenant $tenant -p $password

echo "az account set --subscription '$subs'"

az account set --subscription "$subs"