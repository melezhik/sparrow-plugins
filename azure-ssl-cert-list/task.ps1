
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg = config 'resource_group'

$thumbprint = config 'thumbprint'

$params = @{ }

$params.add('ResourceGroupName', $rg);

Write-Host "ssl certs for resource group: $rg`n"

if (-not ([string]::IsNullOrEmpty($thumbprint)) ) {
  $params.add('-Thumbprint', $thumbprint);
  Write-Host "filter by thumbprint $thumbprint`n"
}



Get-AzureRmWebAppCertificate @params

