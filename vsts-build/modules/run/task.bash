#!/bin/bash

set -e

definition=$(config definition)

branch=$(git symbolic-ref HEAD 2>/dev/null)

echo vsts build queue --definition-name $definition --branch $branch

vsts build queue --definition-name $definition --branch $branch -o table

#vsts build list | head

