# SYNOPSIS

Fetch and check ACL entries for adls folders.

# INSTALL

    $ sparrow plg install azure-adls-acl-check

# USAGE

Tomtit/Sparrowdo

    task-run "check acls", "azure-adls-acl-check", %(
      adls => "adls-dev" # the name of ADLS instance,
      list => ( # list of folders and check rules
        %( 
          path => "/", # this should be folder path
          check => [
            "user:6f1f01cb-a962-40c5-81ab-a5b17aaa5f8f:rwx", # these should be ACL entries
            "user:2f1f01cb-a952-40c5-91ab-c5b12aca7f83:rwx",
            "group:1a1c01cb-a137-40c2-71a4-a7b13aca7f83:rwx",
          ] 
          path => "/dir1", 
          check => [
            "user:6f1f01cb-a962-40c5-81ab-a5b17aaa5f8f:rwx",
            "user:2f1f01cb-a952-40c5-91ab-c5b12aca7f83:rwx",
            "group:1a1c01cb-a137-40c2-71a4-a7b13aca7f83:rwx",
          ] 
        ),  
      )
    )


# Requirements

az cli 

# Author

Alexey Melezhik

