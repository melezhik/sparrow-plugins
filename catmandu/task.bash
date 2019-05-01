set -e

in=$(config in)
out=$(config out)


catmandu $(cli_args) < $in > $out

