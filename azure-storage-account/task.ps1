
$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg = config 'resource_group'
$name = config 'name'
$location = config 'location'
$sku_name = config 'sku_name'


$params = @{ }

$params.add('ResourceGroupName', $rg);

$params.add('-Name', $name);

$params.add('-SkuName', $sku_name);

$params.add('-Location', $location);

Write-Host "create storage account $name@$rg"

Write-Host "sku name: $sku_name"

Write-Host "location: $location"


New-AzureRmStorageAccount @params
