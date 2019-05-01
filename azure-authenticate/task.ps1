
$client_id = config 'client_id'

$tenant_id = config 'tenant_id'

$context = config 'context'

Write-Host "Authentication for client_id - $client_id, tenant_id - tenant_id, context: $context"

$cred = Get-Credential -UserName $client_id -Message "Enter Password"

Connect-AzureRmAccount -Credential $cred -ServicePrincipal -TenantId $tenant_id

#Set-AzureRMContext -Subscription "Contoso Subscription 1" -Name $context

Set-AzureRMContext -TenantId $tenant_id -Name $context

#Enable-AzureRmContextAutosave



