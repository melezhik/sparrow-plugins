set -e

group=$(config group)
name=$(config name)
template=$(config template)

location=$(config template)

mode=$(config mode)
verbose=$(config verbose)

app_service_restart=$(config app_service_restart)
app_service=$(config app_service)

echo "deployment into subgroup: {$subgroup}, mode: ${mode}, verbose: {$verbose}, template: {$template}"

if test "${verbose}" = "True"; then
  verbose_opt="--verbose"
  echo "template:"
  echo "===================="
  cat "${template}"
else
  verbose_opt=""
fi

if test "${mode}" = "create"; then
  if test "${suboup}" = "group"; then
    echo az deployment group create $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}"
    az deployment group create $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
    if test "${app_service_restart}" = "True"; then
      echo az webapp restart -n "${app_service}" -g "${group}"
      az webapp restart -n "${app_service}" -g "${group}" -o table 2>&1
    fi
  elif test "${subgroup}" = "sub"; then
    echo az deployment sub create $verbose_opt -n "${name}" -l "${location}" --template-file "${template}" --parameters @"${parameters}"
    az deployment sub create $verbose_opt -n "${name}" -l "${location}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
  else
    echo "deployment into subgroup ${sub_group} is not supported"
    exit 2
  fi
elif test "${mode}" = "validate"; then
  if test "${subgroup}" = "group"; then
    echo az deployment group validate $verbose_opt -n "${name}" -g  "${group}" --template-file "${template}" --parameters @"${parameters}"
    az deployment group validate $verbose_opt -n "${name}" -g "${group}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
  elif test "${subgroup}" = "sub"; then
    echo az deployment sub validate $verbose_opt -n "${name}" -l "${location}" --template-file "${template}" --parameters @"${parameters}"
    az deployment sub validate $verbose_opt -n "${name}" -l "${location}" --template-file "${template}" --parameters @"${parameters}" -o table 2>&1
  else
    echo "deployment into subgroup ${subgroup} is not supported"
    exit 2
  fi
else
  echo "bad mode: ${mode}";
  exit 1;
fi
