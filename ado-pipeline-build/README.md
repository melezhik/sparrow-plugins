# SYNOPSIS

Run Ado pipelines and list builds using `azure devops cli`

# INSTALL

    $ s6 --install ado-pipeline-build

# USAGE

Queue WebApp pipeline build for the current branch:

    $ s6 --plg-run ado-pipeline-build@name=WebApp,action=run

List builds for the current branch and pipeline named WebApp:

    $ s6 --plg-run ado-pipeline-build@action=list,name=WebApp

Raku:

    # queue new build
    my %state = task_run "run my build", "ado-pipeline-build", %(
      name => "WebApp",
      variables => "foo:1 bar:2",
      action => "run"
    );

    # the same but using build definition id, instead of pipeline name
    my %state = task_run "run my build", "ado-pipeline-build", %(
      definition_id => "121255",
      variables => "foo:1 bar:2",
      action => "run"
    );

    # get build properties
    say %state<id>; # build id
    say %state<buildNumber>; # build number 

    # wait till a build is finished
    my %res = task_run "wait my build", "ado-pipeline-build", %(
      action => "wait",
      build_id => %state<id>
    );

    # get build results
    say %res<status>; # completed
    say %res<result>; # failed/succeeded/canceled

    # list all builds for a named pipeline and current branch
    task_run "last builds", "ado-pipeline-build", %(
      name => "WebApp",
      action => "list"
    );

# Parameters

## name

Ado pipeline definition name.

## definition_id

Ado pipeline definition id.

## action

Action to execute. `run|list|wait`. Default value is `list` ( list builds )

* `run`

Run build.

* `wait`

Wait till build has finished. Should supply `build_id`

* `list`

List all builds for given build definition and current branch

## project

Set Ado project for a pipeline to run. Optional.

## branch

Git branch to run a build against. If not set current branch is taken

## verbose

Set verbosity for `action=wait`, by default is `False` ( verbosity is disabled )

## variables

Ado variables being set for a build run. Variables format:

```
var1_name:$var_value
var2_name:$var_value
var3_name:$var_value
```

# Dependencies

* powershell
* azure devops cli

# See also

[azure devops cli](https://docs.microsoft.com/en-us/azure/devops/cli/get-started?view=azure-devops)

# Author

Alexey Melezhik
