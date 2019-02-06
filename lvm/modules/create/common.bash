check_lvs () {
  lvs=$(lvs $volume_group 2>/dev/null | awk '{print $1}')
  if [[ $lvs ]]; then
    echo $lvs
  else
    echo 'false'
  fi
}
