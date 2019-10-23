# SYNOPSIS

Calculate permission number for azure devops permissions.

# INSTALL

    $ s6 --install ado-permissions-calculator

# USAGE

List namespaces:

        $ s6 --plg-run ado-permissions-calculator

List permissions for Library:

        $ s6 --plg-run ado-permissions-calculator@namespace=Library

Calculate all permissions for Library:

    $ s6 --plg-run ado-permissions-calculator@namespace=Library,actions=all

Calculate CreateTag, CreateBranch permissions for Git Repositories:

        $ s6 --plg-run ado-permissions-calculator@namespace=GitRepositories,actions=CreateTag:CreateBranch

Use as Sparrow6 tasks:

    # Calculate View, Create permissions for Library
    task-run "permissions sum", "ado-permissions-calculator", %(
      namespace => "Library",
      actions => qqw{View Create}
    );

# Dependencies

* powershell
* azure devops cli


# See also

[az devops security](https://docs.microsoft.com/en-us/cli/azure/devops/security?view=azure-cli-latest)

# Author

Alexey Melezhik
