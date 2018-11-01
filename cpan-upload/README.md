# SYNOPSIS

Small wrapper for [cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload),
disables SSL certificates validation by default.

# INSTALL

    $ sparrow plg install cpan-upload

# USAGE

    # upload archive to CPAN
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz

    # the same but with enabled SSL certificates validation
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param ssl_verify=on

    # delete local distro after upload
    $ sparrow plg run cpan-upload --param distro=$PWD/app-0.0001.tar.gz --param clean=on

# Parameters

## distro

Path to CPAN distribution.

##

# See also

[cpan-upload](https://metacpan.org/pod/distribution/CPAN-Uploader/bin/cpan-upload) - upload a distribution to the CPAN

# Author

Alexey Melezhik

