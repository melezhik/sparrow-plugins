$name = config name
$group = config group

Write-Host "az hdinsight delete --name $name -g $group --yes"

az hdinsight delete --name $name -g $group --yes
