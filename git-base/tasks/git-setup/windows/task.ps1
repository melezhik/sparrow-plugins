$name = config name
$email = config email
$config_scope = config config_scope
$set_credential_cache = config set_credential_cache

if ( $config_scope  -eq "global" ) {

  git config --global --replace-all user.email $email
  git config --global --replace-all user.name  $name

  if ( $set_credential_cache -eq "on" ) {
    git config --global --replace-all credential.helper 'cache --timeout=3000000'
    Write-Host "git credential.helper" $(git config --global credential.helper)
  }

  Write-Host "git user.email" $(git config --global user.email)
  Write-Host "git user.name" $(git config --global user.name)

} else {

  if ( $set_credential_cache -eq "on" ) { 
    git config credential.helper 'cache --timeout=3000000'
    Write-Host "git credential.helper" $(git config  credential.helper)
  }

  git config --replace-all user.email $email
  git config --replace-all user.name  $name

  Write-Host "git user.email" $(git config user.email)
  Write-Host "git user.name"  $(git config  user.name)

}



