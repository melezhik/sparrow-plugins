set -e
args=$(config args)
echo "run [python3 $root_dir/j2lint.py $args] ..."
python3 $root_dir/j2lint.py $args
