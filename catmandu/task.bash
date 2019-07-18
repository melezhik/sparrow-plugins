set -e

in=$(config in)
out=$(config out)


catmandu $(config args) < $in > $out

