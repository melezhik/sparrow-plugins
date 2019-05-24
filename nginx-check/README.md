# SYNOPSIS

nginx-check - checks if nginx server is healthy by executing low level system checks ( ps, etime )

# Build status

[![Build Status](https://travis-ci.org/melezhik/nginx-check.svg)](https://travis-ci.org/melezhik/nginx-check)

# INSTALL

    $ s6 --install nginx-check

# USAGE

    $ s6 --plg-run nginx-check

# Pluign parameters

## validate_etime

Change this to 1 if you want to validate nginx master process age.

## hitask
    
If $validate_etime is set to 1, verify that process is younger than given time period.

Example values: 10 minutes, 1 days, 3 hours

# Usage Example

    $ s6 --plg-run nginx-check@validate_etime=1,hitask="'100 seconds'"

# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)
