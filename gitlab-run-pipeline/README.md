# gitlab-run-pipeline

Runs gitlab pipeline

# install

    $ s6 --install gitlab-run-pipeline

# usage

    task-run "pipe-run", "gitlab-run-pipeline", %(
      debug => True,
      project => 1001,
      gitlab_api => "https://git.company.com/api/v4/",
      variables => %(
        color => "green",
        size => "big",
        use_salt => True
      )
    );

# authentication

Create `~/.gitlab.sh` with the following content:

    export gitlab_trigger={token}

Where {token} is a gitlab [trigger token](https://docs.gitlab.com/ee/ci/triggers/#trigger-token).

Alternatively, just export `gitlab_trigger` env variable explicitly.

# Plugin parameters

## gitlab_api

Gitlab API base URL. Required

## project

Gitlab project. Int|Str. Required

## debug

Enable debug. This will dump http request being sent

## ref

Git branch ref. Optional. Default value is `master`

## variables

Raku Hash. Pipeline variables. Optional.

# Requirements

curl

# author

Alexey Melezhik


