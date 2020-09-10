set -e
set -x

raku -MKind -e "say qq[use Kind from bash OK]"
raku -MMyModule -e "say qq[use MyModule from bash OK]"
