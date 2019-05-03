# SYNOPSIS

Generate git submodules entries based on output from `svn list` command.

# Description


This plugins generates a git submodules entries based on `svn list` command output.

# INSTALL

    $ s6 --install svn-to-git-submodules

# USAGE

    $ sparrow plg run svn-to-git-submodules \
    --param svn_repo=http://svn-repository/projects/list \
    --param git_repo=http://git-repo/projects \
    --param outdir=/path/to/directory/with/git/repo

# Parameters 

## svn_repo

This should svn repo URL to return a list of directories. Obligatory. No default value.

## git_repo

This should git repo URL. Obligatory. No default value. 

Thus a submodule gets added from $git_repo into super repository with the following command:

    git submodule add $git_repo/$directory.git $directory

Where `$directory` is a name of directory in list fetched by command:

    svn list $svn_url

## outdir

This should be location of local Git repository ( super repository ), where `.gitmodules` file located. 

Obligatory.

No default value.

## postfix

If $postfix is set a $postfix string gets added to the end of git repository path when doing 

    $ git sub module add $repo $name

So if postfix defined a command will be:

    $ git sub module add $repo$postfix.git

# See also

[git-submodule](https://git-scm.com/docs/git-submodule)

# Author

[Alexey Melezhik](mailto:melezhik@gmail.com)

