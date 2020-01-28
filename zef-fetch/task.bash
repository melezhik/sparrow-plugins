user=$(config user)
identity=$(config identity)

if test -z $user; then

  echo | zef look $identity || exit 1

else

  if [[ $os == alpine ]]; then
    su -s `type -P bash` -l -c "echo | zef look $identity" $user || exit 1
  else
    su --shell `type -P bash` --login -c "echo | zef look $identity" $user || exit 1
  fi
  
fi
