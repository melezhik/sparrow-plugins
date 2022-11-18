name=$(config name)

echo "stop docker instance, name: $name ..."

docker stop -t 1 $name 2>/dev/null || echo "no $name container running"
