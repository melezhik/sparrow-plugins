set -e

rg=$(config rg)
kv=$(config kv)
object_id=$(config object_id)

echo az keyvault set-policy -g $rg -n $kv --secret-permissions get list --object-id $object_id

az keyvault set-policy -g $rg -n $kv --secret-permissions get list --object-id $object_id -o table
