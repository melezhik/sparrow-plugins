tabsize=$(config tabsize)
user=$(config user)
speller=$(config speller)

if (( $tabsize > 0 )); then
  cat << EOF > /tmp/.nanorc && echo rc file generated from template
set tabstospaces
set tabsize $tabsize
set speller "$speller"
set hitasklog
EOF
else
  echo bad tabsize: $tabsize
  echo 'should be int, > 0'
  exit 1
fi

chmod a+r /tmp/.nanorc || exit 1

if test -z $user; then

  mv -f /tmp/.nanorc ~/ && echo rc file updated
  
else

  su --shell `which bash` --login -c "cp -f /tmp/.nanorc ~/" $user && echo rc file updated for user $user

fi
