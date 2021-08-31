# k8s-node-check

Check k8s node

# Install

    s6 --install k8s-node-check

# Usage

Raku

    my %data = task-run "wrk-node", "k8s-node-check" %(
      name => "wrk-foo-var-001",
      annotations => %(
        "machine.openshift.io/cluster-api-delete-machine" => ""
      ),
      labels => %(
        "kubernetes.io/os" => "linux"
      )
    );

    # Access k8s resource

    say %data.keys.perl;  # ("__data__", "metadata", "apiVersion", "spec", "kind", "status").Seq

    say %data<spec><providerID>;

# Verification parameters

## name

Name of node. Required.

## annotations

Array|Hash of annotations.

Examples:

    # just check that annotations exists
    [
      "machine.openshift.io/cluster-api-delete-machine",
      "failure-domain.beta.kubernetes.io/region"
    ]

    # Hash form, check values as well
    %(
      "machine.openshift.io/cluster-api-delete-machine"  => "",
      "failure-domain.beta.kubernetes.io/region" => "OS-US10",
    )

## labels

Array|Hash of labels.

The same logic as for annotations.

# Examples

See some examples here:

* examples/


# Dependencies

`k8s cli`

# Author

Alexey Melezhik
