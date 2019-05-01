
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg = config 'resource_group'

$app_service = config 'app_service'

Write-Host "service info: $app_service@$rg"

Get-AzureRmWebApp -ResourceGroupName $rg -Name $app_service


