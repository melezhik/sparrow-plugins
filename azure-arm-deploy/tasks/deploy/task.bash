set -e

group=$(config group)
name=$(config name)
template=$(config template)

mode=$(config mode)
verbose=$(config verbose)
app_service_restart=$(config app_service_restart)
app_service=$(config app_service)

if test "${verbose}" = "True"; then
  verbose_opt="--verbose"
  echo "template:"
  echo "===================="
  cat "${template}"
else
  verbose_opt=""
fi 

if test "${mode}" = "create"; then
  echo az deployment group create $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}"
  az deployment group create $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
  if test "${app_service_restart}" = "True"; then
    echo az webapp restart -n "${app_service}" -g "${group}"
    az webapp restart -n "${app_service}" -g "${group}" -o table 2>&1
  fi
elif test "${mode}" = "validate"; then
  echo az deployment group validate $verbose_opt -n "${name}" -g  "${group}" --template-file "${template}" --parameters @"${parameters}"
  az deployment group validate $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
else
  echo "bad mode: ${mode}";
  exit 1;
fi


