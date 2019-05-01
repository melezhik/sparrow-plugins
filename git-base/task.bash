set -e
name=$(config name)
email=$(config email)
config_scope=$(config config_scope)
set_credential_cache=$(config set_credential_cache)

if test "${config_scope}" = "global"; then

  git config --global --replace-all user.email "${email}"
  git config --global --replace-all user.name "${name}"

  if test "${set_credential_cache}" = "on"; then
    git config --global --replace-all credential.helper 'cache --timeout=3000000'
    echo git credential.helper $(git config --global credential.helper)
  fi

  echo git user.email $(git config --global user.email)
  echo git user.name $(git config --global user.name)

else

  if test "${set_credential_cache}" = "on"; then
    git config credential.helper 'cache --timeout=3000000'
    echo git credential.helper $(git config  credential.helper)
  fi

  git config --replace-all user.email "${email}"
  git config --replace-all user.name "${name}"

  echo git user.email $(git config user.email)
  echo git user.name $(git config  user.name)

fi



