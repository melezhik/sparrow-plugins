# SYNOPSIS

Generates self signed certificate to sign Microsoft app packages.


# INSTALL

    $ s6 --install uwp-self-signed-cert

# USAGE

CLI:

    # generate certificate cert.pfx for /CN=Superco
    # place certificate into current working directory

    $ s6 --plg-run uwp-self-signed-cert@subj=/CN=Superco --cwd $PWD

# Parameters
  
## subj

Sets subject name. Default value is `CN=localhost`.

## days

Set expiration date in days. Default value is `365`.

# Author

Alexey Melezhik

# See also

* [req - PKCS#10 certificate request and certificate generating utility.](https://wiki.openssl.org/index.php/Manual:Req(1))

* [open ssl man pages](https://wiki.openssl.org/index.php/Manual:Openssl(1))

* [Signing an app package (Windows Store apps)](https://msdn.microsoft.com/en-us/library/windows/apps/br230260%28v=vs.110%29.aspx?f=255&MSPPError=-2147217396)
