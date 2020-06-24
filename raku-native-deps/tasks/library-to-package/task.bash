echo "map library: [$library] version: [$version] to native package, os: [$os] ...";

if test "$os" = "centos"; then
  if test -z "$version"; then
     echo  "===>"; 
     dnf --quiet repoquery --whatprovides "lib$library"
     echo  "<==="; 
  else
     echo  "===>"; 
     dnf --quiet repoquery --whatprovides 'lib'$library'.so.'$version'()(64bit)'
     echo  "<==="; 
  fi
else
  echo "os $os is not supported yet, drop me a ticket if you need one";
fi
