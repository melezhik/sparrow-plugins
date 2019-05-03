
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$id = config 'id'

Write-Host "look up service principal by ID: $id ..."

Get-AzureRmADServicePrincipal | Where-Object -Property Id -E $id

