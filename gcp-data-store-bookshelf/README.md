# SYNOPSIS

An Example of Ruby API for Google Gloud DataStore.


# INSTALL


    $ s6 --install gcp-data-store-bookshelf


# USAGE

    $ export GOOGLE_CLOUD_KEYFILE=/path/to/json/file

    # list bookshelf entries:
    $ s6 --plg-run gcp-data-store-bookshelf@project_id=$project_id

    # add bookshelf entry:
    $ s6 --plg-run gcp-data-store-bookshelf@\
    ,project_id=$project_id,action=add\
    ,title="War and Peace"\
    ,author="Лев Николаевич Толстой"\
    ,desciption="School Reading"

# Parameters

## project_id

Should be a Google project ID


# Author

Alexey Melezhik

# See also

* [Cloud Datastore Client Libraries](https://cloud.google.com/datastore/docs/reference/libraries)
* [Google Cloud Authentication](http://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud/v0.44.0/guides/authentication)

