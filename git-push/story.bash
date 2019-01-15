#!/bin/bash

set -e

branch=$(git symbolic-ref HEAD 2>/dev/null)
confirm=$(config confirm)

echo git push origin $branch

if test "${confirm}" = "yes"; then

  echo "Type Y to proceed or Anything else to cancel  [ENTER]:"
  
  read choice
  
  if test "${choice}" = "Y"; then
    git push origin $branch
  fi
  
else
  git push origin $branch
fi




