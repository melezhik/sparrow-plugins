set -e
files=$(config files)
echo "apply go fmt to $files ..."

echo "find . -name \"${files}\" -exec go fmt  {} \\;"

find . -name "${files}" -exec go fmt  {} \;
