set -e

search1=$(config search1)
search2=$(config search2)
exclude=$(config exclude)

ext=$(config ext)

echo "find [$search1] [$search2] [!$exclude] in *.$ext"
echo "==="
echo "find . -name "*.$ext" -exec grep --color -H '$search1' {} \; | grep '$search2'"

if test -z $exclude; then
  if test -z $search2; then
    find . -name "*.$ext" -exec grep --color -H "$search1" {} \; || :
  else
    find . -name "*.$ext" -exec grep --color -H "$search1" {} \; | grep "$search2"  --color || :
  fi
else
  if test -z $search2; then
    find . -name "*.$ext" -exec grep --color -H "$search1" {} \; | grep -v $exclude || :
  else
    find . -name "*.$ext" -exec grep --color -H "$search1" {} \; | grep "$search2"  --color | grep -v $exclude || :
  fi
fi
