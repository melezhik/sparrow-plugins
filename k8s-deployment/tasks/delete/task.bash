set -e
deployment_name=$(config deployment_name)
namespace=$(config namespace)
echo "kubectl delete deploy $deployment_name -n namespace"
echo "==========================================="
kubectl delete deploy $deployment_name -n namespace
