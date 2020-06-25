arch=$(config arch)

echo "map library: [$library] version: [$version] to native package, os: [$os], arch: [$arch] ...";

if test "$os" = "centos"; then
  if test -z "$version"; then
     echo  "===>"; 
     dnf --quiet repoquery --whatprovides "lib$library" --arch $arch
     echo  "<==="; 
  else
     echo  "===>"; 
     dnf --quiet repoquery --whatprovides 'lib'$library'.so.'$version'()(64bit)' --arch $arch
     echo  "<==="; 
  fi
else
  echo "os $os is not supported yet, drop me a ticket if you need one";
fi
