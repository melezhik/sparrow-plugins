#!bash

set -e

in=$(config in)
out=$(config out)

set -x

weasyprint "$in" "$out"
