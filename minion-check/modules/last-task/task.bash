cmd=$(config command)

if eval "$cmd job -S failed -l 1" | grep failed; then
  echo Q=1
else
  echo Q=0
fi
