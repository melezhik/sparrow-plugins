# ado-se-azure-rm

Create ado service endpoint for Azure RM.

# Install

    s6 --install ado-se-azure-rm

# Usage

    # get service endpoint data
    my %state = task-run "list", "ado-se-azure-rm", %(
      task => "get"
      id => "123",
      project => "apps",
    );

    say %state.perl;

    # create service endpoint
    task-run "create", "ado-se-azure-rm", %(
      name =>"assmt-prod2",
      task => "create",
      subscription => {
        id => "33086e22-5829-45cf-bd16-*************",
        name => "assmt-2022",
      },
      sp => {
        id => "7669ee81-****-4491-**********",
        key => "secret",
        tenant-id => "6afcf627-4862-4bef-913f-**********",
      },
      project => {
        id => "2446a0fe-879f-4c11-bb17-7e161a79b68b",
        name => "assessment",
      }
    );

# Parameters

## task

`get|create`. Optional. Default value is `get`

## project

Ado project name

# Author

Aleksei Melezhik


