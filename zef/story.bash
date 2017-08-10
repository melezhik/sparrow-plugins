#!/bin/bash

set -e

export PATH=/opt/rakudo/bin:~/.perl6/bin:$PATH

options=$(config options)

for m in $(config list); do
  echo zef install $m $options
  zef install $m $options
done


