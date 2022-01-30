# k8s-pod-check

Checks that k8s pod(s) is running

# Install

    s6 --install k8s-pod-check

# Usage

    # Verify that all pods having nginx 
    # Prefix in name are running

    task-run "nginx pod check", "k8s-pod-check", %(
      name => "nginx",
      namespace => "dev",
    );

# Parameters

## name

Prefix in pod name. Required.

## namespace

K8s namespace. Optional, default value is `default`

# Dependencies

`k8s cli`

# Author

Alexey Melezhik


