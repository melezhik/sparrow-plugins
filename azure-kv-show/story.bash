set -e

url=$(config url)

if test "${url}"; then
  kv=`perl -e '$ARGV[0]=~/https:\/\/(\S+)\.vault\.azure\.net/; print $1' $url`  
  sec=`perl -e '$ARGV[0]=~/.*\/(\S+)/; print $1' $url`  
else
  kv=$(config kv)
  sec=$(config sec)
fi


echo "================================================="
echo "Key Vault: ${kv}"
echo "Secret Name: ${sec}"
echo "================================================="

az keyvault secret show --name "${sec}" --vault-name "${kv}"
