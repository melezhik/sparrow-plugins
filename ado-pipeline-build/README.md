# SYNOPSIS

Run and list ado builds using `azure devops cli`

# INSTALL

    $ s6 --install ado-pipeline-build

# USAGE

Run build for the current branch:

    $ s6 --plg-run ado-pipeline-build@name=WebApp

List 10 latest builds for the current branch:

    $ s6 --plg-run ado-pipeline-build@action=list,top=10
    
Use as Sparrow6 tasks:

    task_run "run my build", "ado-pipeline-build", %(
      name => "WebApp"
    );

# Parameters

## name

Ado pipeline definition name

## action

Action to execute. `run|list`. Default value is `run` ( run build )


## top

Max results for `list` action. Default values is `5`

# See also

[azure devops cli](https://docs.microsoft.com/en-us/azure/devops/cli/get-started?view=azure-devops)


# Author

Alexey Melezhik
