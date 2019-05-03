if ps uax|grep 'postgres '|grep -v grep; then
  exit 0
else
  exit 2
fi
