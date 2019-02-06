# SYNOPSIS

Minoca third party packages smoke tests.

# Description

* Verify that third party packages are installed successfully
* Optionally run smoke tests for some packages

# Caveat!!!

Don't run this plugin on production system, it might be ***harmful***. Use dedicated
test boxes.

# INSTALL

On running minoca instance:

    $ opkg update
    $ wget -O - http://sparrowhub.org/minoca.sh | sh # bootstraping sparrow tool
    $ sparrow plg install minoca-pkg-test

# USAGE

    $ sparrow plg run minoca-pkg-test

![minoca-pkg-test screen shot](https://raw.githubusercontent.com/melezhik/minoca-pkg-test/master/minoca-pkg-test.png)

# Resolving packages list

Packages list to check gets build in runtime parsing output of `opkg list` command.

## Overriding package list

If you want to override package list choose --param pkg-list option:

    # Check only perl and sqlite packages
    $ sparrow plg run minoca-pkg-test --param pkg-list=perl,sqlite

# Configuring smoke tests

Smoke tests are shell commands gets executed with output gets analyzed. 

Minoca-pkg-test comes with only few smoke tests for some packages, if you want to define new ones it is possible:

    $ sparrow project create minoca
    $ sparrow task add minoca pkg-check minoca-pkg-test
    $ sparrow task ini minoca/pkg-check

    <smoke_test>
      <perl>
        command perl --version
        output  This is perl 5
      </perl>
      <sqlite>
        command sqlite3 --version
        output regexp: \d\.\d\.\d
      </sqlite>
      <screen>
        command screen --version
        output regexp: Screen version \d
      </screen>
      <tar>
        command tar --version
        output tar (GNU tar)    
      </tar>
      # bla bla bla
    </smoke_test>

    $ sparrow task run minoca/pkg-check

# Helper actions

## List installed packages

To know what packages are already installed use `list-installed` action.

    $ sparrow plg run minoca-pkg-test --param action=list-installed

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)  

  
