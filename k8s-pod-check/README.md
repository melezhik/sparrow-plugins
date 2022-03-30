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

    # Verify group of pods:

    $checks-failed = 0;

    for 'pod1', 'pod2', 'pod3' -> $p {

      my %st = task-run "pod check", "k8s-pod-check", %(
        name => $p,
        namespace => "dev",
        die-on-check-fail => False,
      );

      $checks-failed += %st<__data__><task-check-err-cnt> || 0;

    }

    say "checks failed: ", $checks-failed;

    die if $checks-failed;

# Parameters

## name

Prefix in pod name. Required.

## namespace

K8s namespace. Optional, default value is `default`

## num

Number of pods running. Optional. Default value is `1`

## die-on-check-fail

Don't die if a pod check fails, useful when test a group of pods.

Optional. Default values is `True`.

## debug

Bool. Enable debug mode. Optional. Default value is `False`

# Dependencies

`k8s cli`

# Author

Alexey Melezhik


