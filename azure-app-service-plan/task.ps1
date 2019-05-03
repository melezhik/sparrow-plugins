
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg = config 'resource_group'

$app_service_plan = config 'app_service_plan'

Write-Host "app serive plan: $app_service_plan@$rg`n"

$plan = Get-AzureRmAppServicePlan -ResourceGroupName $rg -Name $app_service_plan

Write-Host "Sku Name:" $plan.Sku.Name
Write-Host "Sku Family:" $plan.Sku.Family
Write-Host "Sku Capacity:" $plan.Sku.Capacity
Write-Host "Sku Size:" $plan.Sku.Size
Write-Host "Sku Tier:" $plan.Sku.Tier

$params = @{}

$size = config 'size'

$workers_num = config 'workers_num'

if (-not ([string]::IsNullOrEmpty($size)) ) {
  $params.add('-WorkerSize', $size);
}

if (-not ([string]::IsNullOrEmpty($workers_num)) ) {
  $params.add('-NumberofWorkers', $workers_num);
}

if (-not $params.Count -eq 0 ) {

  Write-Host "`nupdate $app_service_plan@$rg ... \n"

  Set-AzureRmAppServicePlan -ResourceGroupName $rg -Name $app_service_plan @params

  Write-Host "app serive plan updated: $app_service_plan@$rg"

  $plan = Get-AzureRmAppServicePlan -ResourceGroupName $rg -Name $app_service_plan

  Write-Host "Sku Name:" $plan.Sku.Name
  Write-Host "Sku Family:" $plan.Sku.Family
  Write-Host "Sku Capacity:" $plan.Sku.Capacity
  Write-Host "Sku Size:" $plan.Sku.Size
  Write-Host "Sku Tier:" $plan.Sku.Tier


}




