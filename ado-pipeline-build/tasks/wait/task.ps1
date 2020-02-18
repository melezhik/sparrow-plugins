$build_id = config build_id

$verbose = config verbose

$project = config project

if ( -not [string]::IsNullOrEmpty($project) ) {

    $opts += "--project $project"
    Write-Host "project set: $project"

}

$status_cmd = "az pipelines build show $opts --id $build_id --query `"{status:status}`" -o tsv"
$res_cmd = "az pipelines build show $opts --id $build_id --query `"{result:result}`" -o tsv"

while ( $true ){

  $status = iex $status_cmd

  if ( $verbose -eq $true ) {
    Write-Host "current status for build_id: <$($build_id)> - <$($status)>"
  }

  if ( $status -eq 'completed' ) {

    $result = iex $res_cmd

    Write-Host "result for build_id: <$($build_id)> - <$($result)>"

    break

  }


}
