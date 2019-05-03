path=$(config path)
owner=$(config owner)
group=$(config group)
mode=$(config mode)
recursive=$(config recursive)

set -e


if test $recursive -eq 1; then
  mkdir -p $path
else
  mkdir $path
fi

if test "${owner}"; then
  chown $owner -R $path
fi

if test "${group}"; then
  chown :$group -R $path
fi

if test "${mode}"; then
  chmod $mode $path
fi

if ! test $os = "minoca" && ! test $os = "darwin"; then

  echo -n 'directory path: '
  stat -c %n -- $path
  
  echo -n 'directory owner: '
  stat -c '<'%U'>' -- $path
  
  echo -n 'directory group: '
  stat -c '<'%G'>' -- $path
  
  echo -n 'directory access rights: '
  stat -c %A -- $path
  
fi



