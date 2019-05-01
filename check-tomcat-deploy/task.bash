version=$(config tomcat-version)
file=$(config file)
lines=$(config lines)
if test $file; then
  tail -n $lines $file
else
  tail -n $lines /var/log/tomcat$version/catalina.out
fi

