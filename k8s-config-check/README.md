# k8s-config-check

Check k8s config maps and secrets

# Install

    s6 --install k8s-config-check

# Usage

Raku

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

# Examples

See some examples here:

* examples/

# Dependencies

`k8s cli`

# Author

Alexey Melezhik


