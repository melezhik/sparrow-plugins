# SYNOPSIS

Small wrapper for [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) with few features:

- Disabling SSL verification by default
- Deleting archive file upon upload

# INSTALL

    $ s6 --install cpan-upload

# USAGE

As one liners:

    # upload archive to CPAN without SSL verification
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz

    # the same with SSL verification
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param ssl_verify=on

    # delete local distro after upload
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param clean=on

As task:


    $ sparrow project create cpan

    $ sparrow task add cpan upload cpan-upload

    $ sparrow task ini cpan/upload

      clean=on
      ssl_verify=off

    $ sparrow task run cpan/upload --param distro=$PWD/app-0.0001.tar.gz

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

