# k8s-deployment-check

Check k8s deployments and stateful sets

# Install

    s6 --install k8s-deployment-check

# Usage

Raku

    my %data = task-run "dpl check", "k8s-deployment-check", %(
      name => "animals",
      namespace => "pets",
      command => "/usr/bin/cat",
      args => [
        "eat", "milk", "fish" 
      ],
      env => [
        "ENABLE_LOGGING"
      ]
      volume-mounts => {
        foo-bar => "/opt/foo/bar",
      }
    );

    # Access k8s resource

    say %data.keys.perl; 

    # ("env", "image", "imagePullPolicy", "command", 
    # "terminationMessagePolicy", "name", "envFrom", "ports", 
    # "__data__", 
    # "args", 
    # "terminationMessagePath", "livenessProbe", "resources", "volumeMounts").Seq

    say %data<command>;

# Verification parameters

## name

Name of deployment. Required.

## namespace

Name of namespace. Required.

## resource_type

Resource type to check:

deployment|statefulset. Optional. Default value is `deployment`. Use `statefulset` to validate k8s stateful sets.

## container

Name of container. Optional. If not set _the first_ container in a containers list is check.

## volume-mounts

Array|Hash. List of mounted volumes in a format

Array:

    "name mountpath"

Hash:

    name => mountpath

For subPath use following notation:

Array:

    "name mountpath@subpath"

Hash:

    name => mountpath@subpath

## env

Array|Hash of environment variables.

Examples:

    # just check environment variables names
    [
      "DB_LOGIN",
      "DB_PASSWORD"
    ]

    # check if DB_PASSWORD var gets read from secret named "postgresql", key "database-password"
    [
      "DB_LOGIN",
      "DB_PASSWORD=secret:postgresql:database-password"
    ]

    # check explicit values
    [
      "DB_LOGIN=admin"
    ]

    # Hash form
    %(
      DB_LOGIN  => "admin",
      DB_PASSWORD => "secret:postgresql:database-password"
    )

## image

Str. Image name

## command

Array|Str. Docker command

## command-args

Array|Str. Docker command arguments

# Examples

See some examples here:

* examples/

# Dependencies

`k8s cli`

# Author

Alexey Melezhik
