set -e
args=$(config args)
echo "run [jinjalint $args] ..."
jinjalint $args
