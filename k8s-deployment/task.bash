set -e

deployment_name=$(config deployment_name)
app_name=$(config app_name)
image=$(config image)
container_port=$(config container_port)
dry_run=$(config dry_run)

cat << HERE > $cache_dir/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $deployment_name
  labels:
    app: $app_name
spec:
  replicas: $replicas
  selector:
    matchLabels:
      app: $app_name
  template:
    metadata:
      labels:
        app: $app_name
    spec:
      containers:
      - name: $app_name
        image: $image
        ports:
        - containerPort: $container_port
HERE

echo "kubectl apply -f $cache_dir/deployment.yaml"
echo "==========================================="
echo "$cache_dir/deployment.yaml:"
cat $cache_dir/deployment.yaml
echo "==========================================="

if test "$dry_run" = "True"; then
  echo "dry run is enabled, exit here"
else
  kubectl apply -f $cache_dir/deployment.yaml
fi
