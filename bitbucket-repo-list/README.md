# SYNOPSIS

List Bitbucket repositories. Pagination included! (:


# INSTALL


    $ s6 --install bitbucket-repo-list

# USAGE

    $ s6 --plg-run bitbucket-repo-list@\
    ,login=superuser,password=keep-it-secret\
    ,team=heroes\
    ,project=humans

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
