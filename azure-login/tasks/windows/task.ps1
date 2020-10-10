$password = config password
$user = config user
$subs = config subs
$tenant = config tenant

Write-Host "az login --service-principal -u $user  --tenant $tenant -p ***********"

az login --service-principal -u $user  --tenant $tenant -p $password

if ($lastexitcode -ne 0) {
    exit $lastexitcode
}

Write-Host "az account set --subscription '$subs'"

az account set --subscription "$subs"
