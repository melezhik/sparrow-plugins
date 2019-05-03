# SYNOPSIS

Make an asynchronous push to remote git repositories.


# INSTALL

    s6 --install git-async-push


# USAGE

    sparrow plg run git-async-push \
    --param git_remote=https://bitbucket.org/superteam \
    --param local_dir=/path/to/local/git/repositories/


# Parameters

## git_remote

This should be a remote git repository URL _representing_ a realm of your multiple repositories.

For example, if you use BitBucket, this could be a `team` container:

    --param git_remote=https://bitbucket.org/superteam

## local_dir

This should be a local path to a directory containing a _local git repositories_ to get pushed.

So an example layout should be:

    # local_dir:
    /home/melezhik/repos/

    # foo repository:
    /home/melezhik/repos/foo/ -- remote git url ---> $git_remote/foo.git

    # baz repository:
    /home/melezhik/repos/baz/ -- remote git url ---> $git_remote/baz.git

    so on ...

So the convention is that the names of the sub directories at the `$local_dir` should _match_ 
names of the _remote git repositories_ :

    $git_remote/$directory.git

A plugin goes through the list of repositories and asynchronously push data into a remote git repos.
An asynchronous behavior is implemented by simple Linux background process using `&`.  

## project

Only proceed a given project. Should be a name of sub directory inside `$local_dir`

For example:

    --param project=baz

## postfix

An optional parameter, if set - add `$postfix` string to the name of remote repository being pushed.

For example:

    --param  postfix='-bar-baz'

This technically means that for `foo` directory will be used a following remote repository:

    # foo repository:
    /home/melezhik/repos/foo -- remote git url ---> $git_remote/foo-bar-baz.git
    
# Author

Alexey Melezhik

