#!/bin/bash

set -e

branch=$(git symbolic-ref HEAD 2>/dev/null)

echo git pull origin $branch

git pull origin $branch



