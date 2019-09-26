$name = config name
$branch = git symbolic-ref HEAD
$variables = config variables

if ( -not [string]::IsNullOrEmpty($variables) ) {

    $variables_opt = "--variables $variables"
    Write-Host "variables set: $variables"

}

$command = "az pipelines build queue --definition-name $name --branch $branch $variables_opt"

Write-Host "Running: $($command)"

iex $command
