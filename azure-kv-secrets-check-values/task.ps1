$list = config list
$name = config name

Write-Host "keyvaut: $name"

foreach ( $n in $list ) {

	Write-Host "[$n]"
	Write-Host -NoNewline "$n = "
	az keyvault secret show --name $n --vault-name $name -o tsv --query value
	if ($LastExitCode -ne 0){
		exit($LastExitCode)
	}
}
