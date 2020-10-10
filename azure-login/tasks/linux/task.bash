#!bash

set -e

password=$(config password)
user=$(config user)
subs=$(config subs)
tenant=$(config tenant)

echo "az login --service-principal -u $user  --tenant $tenant -p *******"

az login --service-principal -u $user  --tenant $tenant -p $password

echo "az account set --subscription '$subs'"

az account set --subscription "$subs"
