$name = config name

$branch = config branch

if ( [string]::IsNullOrEmpty($branch) ) {

  $branch = git symbolic-ref HEAD

}

$variables = config variables

if ( -not [string]::IsNullOrEmpty($variables) ) {

    $opts += "--variables $($variables -replace ':','=')"
    Write-Host "variables set: $variables"

}

$project = config project

if ( -not [string]::IsNullOrEmpty($project) ) {

    $opts += " --project $project"
    Write-Host "project set: $project"

}

$command = "az pipelines build queue --definition-name $name --branch $branch $opts --output table"

Write-Host "Running: $($command)"

iex $command
