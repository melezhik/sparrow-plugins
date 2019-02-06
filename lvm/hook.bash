action=$(config action)
recreate=$(config recreate)
force=$(config force)

if [[ $action == create ]] && [[ $recreate == true ]]; then
  run_story remove force 'true'
  run_story create
elif [[ $action == create ]]; then
  run_story create
elif [[ $action == remove ]]; then
  run_story remove force $force
elif [[ $action == resize ]]; then
  run_story resize
fi
