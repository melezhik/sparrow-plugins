set -e
args=$(config args)

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "os: linux"
  echo "run [${root_dir}/linux/tflint $args] ..."
  $root_dir/linux/tflint $args
else
  echo "os: linux not supported"
fi


