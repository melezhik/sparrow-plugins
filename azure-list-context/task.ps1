$search = config 'search'

if (-not ([string]::IsNullOrEmpty($search))) {
    Get-AzureRmContext -ListAvailable  | Where-Object { $_.Name -Match $search }
} else {
    Get-AzureRmContext -ListAvailable
}



