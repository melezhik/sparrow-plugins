# SYNOPSIS

Export (multiple) svn repositories into (multiple) git repositories.


# INSTALL

    s6 --install git-svn-export

# USAGE

    sparrow plg run git-svn-export \
    --param local_dir=/path/to/local/git/repositories/ \
    --param svn_repo=http://svn_repositories/private

# Parameters

## local_dir

This should be a local path to a directory containing a _local git repositories_. 

If `local_dir` does not exist it will be created and initialized by empty directories get listed as:

    svn list $svn_repo

## svn_repo

This should be a svn repo URL.

For example:

    --param svn_repo=http://svn_repositories/private

## project

Only proceed a given project. Should be a name of sub directory inside `$local_dir`

For example:

    --param project=baz

## skip_init

Set this parameter if you want to skip initialization stage, see `local_dir` parameter section.

    --param skip_init=1

# See also

[git-async-push](https://sparrowhub.org/info/git-async-push) - a plugin for asynchronous pushes to remote git repositories.

# Author

Alexey Melezhik

