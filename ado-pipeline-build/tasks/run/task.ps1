$name = config name
$definition_id = config definition_id

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

if ( -not [string]::IsNullOrEmpty($definition_id) ) {
  $command = "az pipelines build queue --definition-id $definition_id --branch $branch $opts --output json"
} else {
  $command = "az pipelines build queue --definition-name $name --branch $branch $opts --output json"
}


Write-Host "Running: $($command)"

iex $command | Out-File -FilePath "$(cache_root_dir)/state.json"
