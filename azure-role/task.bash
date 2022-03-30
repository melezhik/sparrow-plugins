set -e

appId=$(config appId)
role=$(config role)
group=$(config group)

echo az role assignment create --assignee "${appId}" --role "${role}" --resource-group "${group}"
az role assignment create --assignee "${appId}" --role "${role}" --resource-group "${group}"
