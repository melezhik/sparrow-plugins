file=$(config file)
pat1=$(config pat1)
pat2=$(config pat2)
mode=$(config mode)

if test $mode = "1"; then
  awk "/$pat1/,/$pat2/" $file
elif test $mode = "2"; then
  awk "/$pat1/{flag=1; next} /$pat2/{flag=0} flag" $file
elif test $mode = "3"; then
  awk "/$pat1/{flag=1;} /$pat2/{flag=0} flag" $file
elif test $mode = "4"; then
  awk "flag; /$pat1/{flag=1} /$pat2/{flag=0}" $file
elif test $mode = "5"; then
  awk "flag{ if (/$pat2/){printf \"%s\", buf; flag=0; buf=\"\"} else buf = buf \$0 ORS}; /$pat1/{flag=1}" $file
fi
