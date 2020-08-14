set -e

args=$(config args)

set -x

aws lambda update-function-code $args

