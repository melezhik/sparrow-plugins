$namespace = config namespace
$actions = config actions

if ( [string]::IsNullOrEmpty( $namespace ) )  {
  az devops security permission namespace list --query "[].{name:name }" -o tsv
} else {
  $namespace = $namespace.ToLower()
  $list = az devops security permission namespace list --query "[].{name:name id:namespaceId}" -o json | ConvertFrom-Json
  $namespaces = @{}
  foreach ( $i in $list ){
    $k = ($i.name -replace '\s','').ToLower()
    $namespaces[$k] = $i.id
  }

  if ( $namespaces.ContainsKey($namespace)) {
    Write-Host "namespace: $($namespace), namespace_id: $($namespaces[$namespace])"
    Write-Host "==="
  } else {
    Write-Host "namespace $($namespace) not found"
    exit(1)
  }

  if ( [string]::IsNullOrEmpty( $actions ) )  {

      az devops security permission namespace show --id $namespaces[$namespace]

  } else {

    az devops security permission namespace show --id $namespaces[$namespace]

    $list = az devops security permission namespace show --id $namespaces[$namespace] --query "[0].{actions:actions}"  -o json | ConvertFrom-Json

    $allow_sum = 0
    $all_sum = 0

    if ( $actions -is [array] ) {
      $action_list = $actions
    } else {
      $action_list = $actions -split ':'
    }


    foreach ( $i in $list.actions ) {
        $all_sum += $i.bit
        foreach ( $j in $action_list ) {
            if ( $j -eq 'all') {
              $allow_sum += $i.bit
            } elseif ( $j.ToLower() -eq $i.name.ToLower() ) {
              $allow_sum += $i.bit
            }
        }
    }

    Write-Host "==="

    Write-Host "actions: $($action_list | ConvertTo-Json )"

    Write-Host "Allow_sum: $allow_sum"

    Write-Host "Deny_sum: $($all_sum - $allow_sum)"

  }


}
