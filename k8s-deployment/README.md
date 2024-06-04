# k8s-deployment

Create, delete k8s deployment

# Install

    s6 --install k8s-deployment

# Usage

    task-run "dpl create", "k8s-deployment", %(
      deployment_name => "nginx",
      namespace => "default",
      app_name => "nginx",
      image => "nginx:1.14.2",
      replicas => 3,
    );

    task-run "dpl delete", "k8s-deployment", %(
      deployment_name => "nginx",
      namespace => "default",
      action => "delete",
    );

# Parameters

## action

Action to perform. Optional. Default value is `create`

## namespace

Kubernetes namespace. Optional. Default value is `default`

## deploy_name

Name of deployment. Required.

## app_name

Name of application (aka template.metadata.labels.app). Required.

## image

Container image name. Required.

## replicas

Number of replicas. Optional. Default value is `3`.

## container_port

Container port. Optional. Default value is `80`.

# dry_run

Dry run mode. Optional. Default value is `False`.

# Dependencies

`k8s cli`

# Author

Alexey Melezhik
