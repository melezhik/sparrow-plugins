# k8s-config-check

Check k8s config maps and secrets

# Install

    s6 --install k8s-config-check

# Usage

Raku

    # Verify that web-config has entries

    my %data = task-run "cm check", "k8s-config-check", %(
      type => "configmap",
      name => "web-config",
      namespace => "dashboards",
      # check if we have admin and password entries 
      # in config map
      data => [
        "note: creds for login",
        "[admin=root]",
        'regexp: "[password=" \S+ "]" $$',
      ]
    );

    # Access to entries

    say %data<data><password>;

    # Verify group of resources:

    $checks-failed = 0;

    for 'c-map1', 'c-map2', 'c-map3' -> $cm {

      my %st = task-run "pod check", "k8s-pod-check", %(
        type => "configmap",
        name => $cm,
        namespace => "dashboards",
        die-on-check-fail => False,
      );

      $checks-failed += %st<__data__><task-check-err-cnt> || 0;

    }

    say "checks failed: ", $checks-failed;

    die if $checks-failed;

# Verification parameters

## name

Name of a resource. Required.

## namespace

Name of namespace. Required.

## resource_type

Resource type to check:

configmap|secret. Optional. Default value is `configmap`. Use `secret` to validate k8s secrets.

## data

Array|Hash of entries.

Examples:

    # just check variables names
    [
      'regexp: ^^ "DB_LOGIN=" \S+',
      'regexp: ^^ "DB_PASSWORD=" \S+',
    ]

    # just check variables AND values
    [
      "DB_LOGIN=admin",
      "DB_PASSWORD=supeRsecRet1"
    ]

    # comments
    [
      "note: db_login should be set",
      "DB_LOGIN=admin"
    ]

    # Hash form
    %(
      DB_LOGIN  => "admin",
      DB_PASSWORD => 'supeRsecRet1'
    )

# sensitive

Bool. `True|False`. Optional. Default value is `True`

Don't show secret values.

## die-on-check-fail

Don't die if a check fails, useful when test a group of resources.

Optional. Default values is `True`.

# Examples

See some examples here:

* examples/

# Dependencies

`k8s cli`

# Author

Alexey Melezhik


