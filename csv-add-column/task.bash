file=$(config file)
data=$(config data)
awk -v d="$data"  -F"," 'BEGIN { OFS = "," } {$6=d; print}' $file
