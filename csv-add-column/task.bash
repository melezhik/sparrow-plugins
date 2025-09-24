set -e

in=$(config in)

out=$(config out)

data=$(config data)

echo "add $data, in file: $in, out file: $out"

awk -v d="$data"  -F"," 'BEGIN { OFS = "," } {$6=d; print}' $in > $out

