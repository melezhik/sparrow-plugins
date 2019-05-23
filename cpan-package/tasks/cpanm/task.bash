set -e

install_base=$(config install-base)
user=$(config user)
package=$(task_var package)
export http_proxy=$(config http_proxy)
export https_proxy=$(config https_proxy)

if test "${http_proxy}"; then
  set_http_proxy="export http_proxy=${http_proxy};"
fi 

if test "${https_proxy}"; then
  set_https_proxy="export https_proxy=${https_proxy};"
fi 

if test -z $install_base; then


  if test -z $user; then

    echo install $package ...

    cpanm $task_var $package  -q && echo install ok

  else

    echo install $package user $user ...

    su --login --shell `type -P bash` -c "$set_https_proxy $set_http_proxy \
    cpanm $task_var $package -q && echo install ok" $user

  fi

else


  if test -z $user; then
    echo install $package into $install_base ...
    cpanm $task_var $package -q -l $install_base && echo install ok
  else
    echo install $package into $install_base user $user ...
    su --login --shell `type -P bash` -c "$set_https_proxy $set_http_proxy \
    cpanm $task_var $package -q  -l $install_base && echo install ok" $user
  fi

fi


