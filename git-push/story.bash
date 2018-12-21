#!/bin/bash

set -e

branch=$(git symbolic-ref HEAD 2>/dev/null)

echo git push origin $branch

echo "Type Y to proceed or Anything else to cancel  [ENTER]:"

read choice

if test "${choice}" = "Y"; then
  git push origin $branch
fi



