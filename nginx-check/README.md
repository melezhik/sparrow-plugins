# SYNOPSIS

Simple nginx health checker

# INSTALL

    $ s6 --install nginx-check

# USAGE

```
task-run "nginx checker", "nginx-check", %(
  :validate_etime,
  :hitask("100 seconds")
)
```

# Pluign parameters

## validate_etime

Validate nginx master process age. Optional, Default is true.

## hitask

If `validate_etime` is set, verify that process is younger than given time period.

Default value is `10 minutes`

Example values: 

- 10 minutes
- 1 days
- 3 hours

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
