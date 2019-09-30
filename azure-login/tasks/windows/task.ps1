$password = config password
$app_reg = config app_reg
$subs = config subs
$tenant = config tenant

Write-Host "az login --service-principal -u $app_reg  --tenant $tenant -p $password"

az login --service-principal -u $app_reg  --tenant $tenant -p $password

if ($lastexitcode -ne 0) {
    exit $lastexitcode
}

Write-Host "az account set --subscription '$subs'"

az account set --subscription "$subs"