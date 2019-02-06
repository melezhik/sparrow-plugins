table=$(config table.target)
partition=$(config partition.target)

if [[ $table ]] && [[ $partition ]]; then
  echo "Choose one: partition or table. Exiting..." 1>&2

  exit 1
fi

if [[ $table ]]; then
  run_story table

elif [[ $partition ]]; then
  run_story partition
fi
