#!/bin/bash

set -e

options=$(config options)

for m in $(config list); do
  echo zef install $m $options
  zef install $m $options
done


