#!bash
set -e
name=$(config name)
set -x
set +x
az keyvault secret list   --vault-name $name -o tsv


