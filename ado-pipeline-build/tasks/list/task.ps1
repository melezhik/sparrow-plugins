$branch = git symbolic-ref HEAD
$name = config name

az pipelines build list --branch $branch | Select-String -Pattern "\s${name}\s|^ID|^\-" | % { $_.Line }