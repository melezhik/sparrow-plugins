$build_id = config build_id
$verbose = config verbose

while ( $true ){

  $status = az pipelines build show --id $build_id --query "{status:status}" -o tsv

  if ( $verbose -eq $true ) {
    Write-Host "current status for build_id: <$($build_id)> - <$($status)>"
  }

  if ( $status -eq 'completed' ) {

    $result = az pipelines build show --id $build_id --query "{result:result}" -o tsv

    Write-Host "result for build_id: <$($build_id)> - <$($result)>"

    break

  }


}
