who=$(config who)
ok=$(config ok)

echo "hello $who"

if [[ $ok = "True" ]]; then
   echo "I am ok"
else
  echo "What's the matter?"
fi
