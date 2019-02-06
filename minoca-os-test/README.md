# SYNOPSIS


Run system tests against running [Minoca OS](https://github.com/minoca/os)


# INSTALL

***NOTE:*** Installation and test run should be taken on server under Minoca OS.

Install Sparrow tool

    $ opkg update
    $ opkg install perl curl bash gcc make 
    $ ln -s /bin/env /usr/bin/env
    $ curl -L -k http://cpanmin.us -o /usr/bin/cpanm && chmod +x /usr/bin/cpanm
    $ cpanm --notest -q Sparrow
    $ sparrow index update

Install minoca-os-test plugin


    $ sparrow plg install minoc-os-test

![minoca-os-test report](https://raw.githubusercontent.com/melezhik/minoca-os-test/master/minoca-os-test.png)
# USAGE

Just run minoc-os-test plugin:


    $ sparrow plg run minoc-os-test

# Parameters

## test

Runs a single test.

    $ sparrow plg run minoc-os-test --param test=opkg-install-curl

To print out a test list instead of running tests:

    $ sparrow plg run minoc-os-test --param test=show-test-list

# See also

* [Sparrow](https://github.com/melezhik/sparrow)
* [Minoca OS](https://github.com/minoca/os)


# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)    


