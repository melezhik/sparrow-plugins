#!bash

echo "python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $file"

python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $file
