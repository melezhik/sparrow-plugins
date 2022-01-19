set -e

name=$(config name)
subscription=$(config subscription)
rg=$(config rg)

echo az ad sp create-for-rbac --name $name --role contributor --scopes /subscriptions/$subscription/resourceGroups/$rg

az ad sp create-for-rbac --name $name --role contributor --scopes /subscriptions/$subscription/resourceGroups/$rg \
-o json 1>$cache_root_dir/state.json
