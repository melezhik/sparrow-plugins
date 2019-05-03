# SYNOPSIS

Recursively remove adls folders.

# INSTALL

    $ s6 --install azure-adls-fs-remove

# USAGE

Tomtit/Sparrowdo

    task-run "check acls", "azure-adls-fs-remove", %(
      adls => "adls-dev" # the name of ADLS instance,
      path => "/foo/bar" # path to adls folder
    )

## Dry run mode.

Only shows would it do:

    dry_run => True

Skip some pathes

To skip pathes from removal use `skip` option, this should be Perl5 regexp:

    skip => "foo.*" # to skip anything containing foo

# Requirements

az cli

# Author

Alexey Melezhik

