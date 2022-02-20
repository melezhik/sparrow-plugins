set -e

rg=$(config rg)
app=$(config app)

echo az webapp identity assign -g $rg -n $app

az webapp identity assign -g $rg -n $app

#cat $cache_root_dir/state.json

