$name = config name
$group = config group

Write-Host "az hdinsight show --name $name -g $group --query '{ state: properties.provisioningState }'"

az hdinsight show --name $name -g $group --query '{ state: properties.provisioningState }'