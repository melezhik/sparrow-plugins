
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg = config 'resource_group'
$app_service = config 'app_service'


$params = @{ }

$params.add('ResourceGroupName', $rg);

$params.add('-WebAppName', $app_service);

Write-Host "ssl bindings for app service $app_service@$rg`n"

Get-AzureRmWebAppSSLBinding @params

