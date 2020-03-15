# SYNOPSIS

Small wrapper for [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) with few features:

- Disabling SSL verification by default
- Deleting archive file upon upload

# INSTALL

    $ s6 --install cpan-upload

# USAGE

    # upload archive to CPAN without SSL verification
    $ s6 --plg-run cpan-upload@distro=app-0.0001.tar.gz

    # the same with SSL verification
    $ s6 --plg-run cpan-upload@distro=app-0.0001.tar.gz,ssl_verify=on

    # delete local distro after upload
    $ s6 --plg-run cpan-upload@distro=app-0.0001.tar.gz,clean=on

# Parameters

## distro

Path to CPAN distribution.

## clean

Remove local disto upon upload. `on|off`

## ssl_verify

Disable ssl verification. `on|off`

# See also

[cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) - upload a distribution to the CPAN

# Author

Alexey Melezhik

