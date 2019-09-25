$branch = git symbolic-ref HEAD
$top = config top
az pipelines build list --branch $branch --top $top 