action=$(config action)
owner=$(config owner)
group=$(config group)
mode=$(config mode)
target=$(config target)
content=$(config content)
source=$(config source)

set -e

if test "${action}" == "create"; then


  if ! test -z "${content}"; then
    echo "${content}" > $target;
    echo set target content
  fi

  if ! test -z "${source}"; then
    cp -v $source $target;
    echo copy source to target
  else
    touch $target;
    echo touch target
  fi

  echo target created

  if test "${owner}"; then 
    chown $owner $target;
    echo set target owner to $owner
  fi
  
  if test "${group}"; then 
    chown :$group $target;
    echo set target group to $group
  fi
  
  if test "${mode}"; then 
    chmod $mode $target;
    echo set target mode to $mode
  fi
  
elif test "${action}" == "delete"; then
  rm -f $target;
  echo target deleted
else
  echo unknown action $action
  exit 1
fi


