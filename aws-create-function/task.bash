set -e

name=$(config name)
zip_file=$(config zip_file)
handler=$(config handler)
runtime=$(config runtime)
role=$(config role)

set -x

aws lambda create-function \
--function-name $name \
--zip-file fileb://$zip_file \
--handler $handler \
--runtime $runtime --role $role 2>&1
