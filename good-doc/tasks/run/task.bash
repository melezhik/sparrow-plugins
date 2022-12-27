set -x

set -e

raku -I lib $file || echo "error: $!"
