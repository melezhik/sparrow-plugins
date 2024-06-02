# k8s-deployment

Create k8s deployment

# Install

    s6 --install k8s-deployment

# Usage

    task-run "dpl create", "k8s-deployment", %(
      deployment_name => "nginx",
      app_name => "nginx",
      image => "nginx:1.14.2",
      replicas => 3,
    );

# Parameters

## deploy_name

Name of deployment. Required.

## app_name

Name of application (aka template.metadata.labels.app). Required.

## image

Container image name. Required.

## replicas

Number of replicas. Optional. Default value is 3.

# dry_run

Dry run mode. Optional. Default value is False.

# Dependencies

`k8s cli`

# Author

Alexey Melezhik
