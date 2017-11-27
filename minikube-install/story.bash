#!/bin/bash

set -e

curl -sLo minikube https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

curl -sLo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

