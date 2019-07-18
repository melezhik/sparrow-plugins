set -e

in=$(config in)
out=$(config out)


catmandu $(args) < $in > $out

