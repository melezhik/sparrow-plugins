# ado-install-agent

Install/configure ado build agent

# Install

    s6 --install ado-install-agent

# Usage

    task-run "install", "ado-install-agent", %(
      distro => "https://vstsagentpackage.azureedge.net/agent/2.195.2/vsts-agent-linux-x64-2.195.2.tar.gz",
      url => "https://dev.azure.com/melezhik77",
      agent => "agent01",
      token => "foo-bar-baz-foo-bar-baz",
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


# Author

Aleksei Melezhik


