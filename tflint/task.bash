set -e
args=$(config args)

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "os: linux"
  echo "run [${root_dir}/linux/tflint $args] ..."
  $root_dir/linux/tflint $args
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "os: darwin"
  echo "run [${root_dir}/darwin/tflint $args] ..."
  $root_dir/linux/tflint $args
else
  echo "os: linux is not supported"
  exit 1
fi


