# SYNOPSIS

Small wrapper for [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) with few features:

- Disables SSL verification by default
- Deleting archive file upon upload

# INSTALL

    $ sparrow plg install cpan-upload

# USAGE

    # upload archive to CPAN without SSL verification
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz

    # the same but with enabled SSL certificates validation
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param ssl_verify=on

    # delete local distro after upload
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param clean=on

# Parameters

## distro

Path to CPAN distribution. `on|off`

## clean

Remove local disto upon upload. `on|off`

## ssl_verify

Disable ssl verification. `on|off`

# See also

[cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) - upload a distribution to the CPAN

# Author

Alexey Melezhik

