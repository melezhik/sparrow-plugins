#!bash

set -e
distro=$(config distro)

if test $(config ssl_verify) = "on"; then
  PERL_LWP_SSL_VERIFY_HOSTNAME=1 cpan-upload $distro
else
  PERL_LWP_SSL_VERIFY_HOSTNAME=0 cpan-upload $distro 
fi

if test $(config clean) = "on"; then
  rm -rf $distro
fi

