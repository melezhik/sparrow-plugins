$name = config name
$group = config group

Write-Host "az hdinsight show --name $name -g $group"

az hdinsight show --name $name -g $group