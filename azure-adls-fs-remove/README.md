# SYNOPSIS

Recursively remove adls folders.

# INSTALL

    $ sparrow plg install azure-adls-fs-remove

# USAGE

Tomtit/Sparrowdo

    task-run "check acls", "azure-adls-fs-remove", %(
      adls => "adls-dev" # the name of ADLS instance,
      path => "/foo/bar" # path to adls folder
    )

Dry run mode.

Only shows would it do:

    dry_run => True

# Requirements

az cli 

# Author

Alexey Melezhik

