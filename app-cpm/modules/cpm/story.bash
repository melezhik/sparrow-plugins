install_base=$(config install-base)
verbose=$(config verbose)
package=$(story_var package)
user=$(config user)

if test "${http_proxy}"; then
  set_http_proxy="export http_proxy=${http_proxy};"
fi 

if test "${https_proxy}"; then
  set_https_proxy="export https_proxy=${https_proxy};"
fi

if test $verbose -eq 1; then
  flags="-v"
else
  flags=""
fi

export http_proxy=$(config http_proxy)
export https_proxy=$(config https_proxy)

# default install, install base is not set
if test -z $install_base; then
    if test -z $user; then
      echo install $package ...
      cpm install $flags -g $package || exit 1
    else
      echo local install $package for user $user ...
      su --shell `which bash` --login -c "$set_https_proxy $set_http_proxy \
      cpm install $flags $package" $user || exit 1
    fi
# install base is set
else
    if test -z $user; then
      echo install $package into $install_base ...
      mkdir -p $install_base || exit 1
      cpm install $flags -L $install_base  $package || exit 1
    else
      echo install $package into $install_base for user $user ...
      su --shell `which bash` --login -c "$set_https_proxy $set_http_proxy \
      mkdir -p $install_base && cpm install $flags -L $install_base  $package" $user || exit 1
    fi
fi

echo 'install ok'

