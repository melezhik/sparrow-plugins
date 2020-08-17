args=$(config args)

set -x

aws lambda delete-function $args 2>&1 && echo "function deleted ok"

