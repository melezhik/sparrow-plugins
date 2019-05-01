user=$(config name)
action=$(config action)

id $user &>/dev/null && user_exists=yes 

if [[ ! $action == delete ]] && [[ ! $action == create ]] ;then
  echo "Allowed action: <create|delete>"
  exit 5
fi

if [[ ! $user_exists == yes ]] && [[ $action == create ]]; then
  run_task create
fi

if [[ $user_exists == yes ]] && [[ $action == create ]]; then
  run_task change
fi

if [[ $user_exists == yes ]] && [[ $action == delete ]]; then
  run_task delete
fi
