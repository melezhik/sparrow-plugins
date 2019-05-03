# SYNOPSIS

List Bitbucket repositories. Pagination included! (:


# INSTALL


    $ s6 --install bitbucket-repo-list

# USAGE

    $ sparrow plg run bitbucket-repo-list \
    --param login=superuser --param password=keep-it-secret \
    --param team=heroes \
    --param project=humans

# Parameters

## login

Your bitbucket login. Obligatory.

## password

Your bitbucket password. Obligatory.

## team

Bitbucket team ID. Obligatory.

## project

Bitbucket project key. Obligatory.

## pagelen

Number of results per page. Optional. Default value 100.

## pages_max

Maximum pages to proccess. Optional. Default value not set - proccess till the end

# Author

Alexey Melezhik
