$name = config name
$branch = git symbolic-ref HEAD
az pipelines build queue --definition-name $name --branch $branch