set -e

echo "generate .cro.yml"

id=$(config id)
name=$(config name)
app=$(config app)

cat << HERE > .cro.yml
cro: 1
id: $id
name: $name
entrypoint: $app
ignore:
  - .cache
HERE
