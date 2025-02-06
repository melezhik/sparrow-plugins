# SYNOPSIS

nginx-check - checks if nginx server is healthy by executing low level system checks ( ps, etime )

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

Validate nginx master process age. Optional, Default is false.

## hitask
    
If `validate_etime` is set, verify that process is younger than given time period.

Example values: 10 minutes, 1 days, 3 hours

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
