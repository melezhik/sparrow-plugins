$context = config 'context'

if (-not ([string]::IsNullOrEmpty($context))) {

  Write-Host "try to use context $context ..."

  Select-AzureRmContext $context -Scope Process

}

$rg   = config 'resource_group'
$path = config 'path'

Write-Host "deploy $path to $rg ...`n`n"

New-AzureRmResourceGroupDeployment -DeploymentName "azure-deploy-arm" -ResourceGroupName $rg -TemplateFile $path 

