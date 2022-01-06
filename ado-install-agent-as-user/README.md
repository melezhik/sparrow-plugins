# ado-install-agent-as-user

Install/configure ado build agent with user privileges


# Install

    s6 --install ado-install-agent-as-user

# Usage

    task-run "install", "ado-install-agent-as-user", %(
      distro => "https://vstsagentpackage.azureedge.net/agent/2.195.2/vsts-agent-linux-x64-2.195.2.tar.gz",
      url => "https://dev.azure.com/melezhik77",
      agent => "agent01",
      token => "foo-bar-baz-foo-bar-baz",
      user => "agent"
    );

# Parameters

## distro

Link to agent distribution tarball

## url

Ado server URL, should include org name

## agent

Agent name. Required. Should not be empty

## token

Ado PAT

## user

Linux user name, agent will run with the user privileges

# Author

Aleksei Melezhik


