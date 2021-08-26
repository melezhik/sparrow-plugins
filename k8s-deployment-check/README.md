# k8s-deployment-check

Check k8s deployment

# Install

    s6 --install k8s-deployment-check

# Usage

Raku

    my %data = task-run "dpl check", "k8s-deployment-check" %(
      name => "animals",
      namespace => "pets",
      cat => %(
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
      )
    );

# Verification parameters

## name

Name of deployment. Required.

## namspace

Name of namespace. Required.

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

List of environment variables

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

Aleksei Melezhik


