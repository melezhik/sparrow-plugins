set -e

mode=$(config mode)
group=$(config group)
template=$(config template)
parameters=$(config parameters)

if test "${mode}" = "create"; then
  set -x
  az group deployment create  -g  "${group}"  --template-file "${template}" --parameters @"${parameters}"
elif test "${mode}" = "validate"; then
  set -x
  az group deployment validate  -g  "${group}"  --template-file "${template}" --parameters @"${parameters}"
else
  echo "bad mode: ${mode}";
  exit 1;
fi


