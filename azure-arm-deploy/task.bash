set -e

mode=$(config mode)
group=$(config group)
template=$(config template)
parameters=$(config parameters)
verbose=$(config verbose)
app_service_restart=$(config app_service_restart)
app_service=$(config app_service)

if test "${verbose}" = "on"; then
  verbose_opt="--verbose"
else
  verbose_opt=""
fi 

if test "${mode}" = "create"; then
  set -x
  az group deployment create $verbose_opt -g  "${group}"  --template-file "${template}" --parameters @"${parameters}"
  set +x
  if test "${app_service_restart}" = "on"; then
    set -x
    az webapp restart -n "${app_service}" -g  "${group}"
  fi 
elif test "${mode}" = "validate"; then
  set -x
  az group deployment validate $verbose_opt -g  "${group}"  --template-file "${template}" --parameters @"${parameters}"
else
  echo "bad mode: ${mode}";
  exit 1;
fi


