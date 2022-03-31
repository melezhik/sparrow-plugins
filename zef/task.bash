#!/bin/bash

set -e

export PATH=/opt/rakudo/bin:~/.perl6/bin:~/.raku/bin:$PATH
declare -a list=$(config list)
options=$(config options)

for m in "${list[@]}"
do
  echo zef install $m $options
  if test $m == '(.)'; then
    zef install . $options 2>&1
  else
    zef install $m $options 2>&1
  fi
done



