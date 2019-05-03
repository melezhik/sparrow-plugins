# SYNOPSIS

An Example of Ruby API for Google Gloud DataStore.


# INSTALL


    $ s6 --install gcp-data-store-bookshelf


# USAGE

    $ export GOOGLE_CLOUD_KEYFILE=/path/to/json/file

    # list bookshelf entries:
    $ sparrow plg run gcp-data-store-bookshelf --param project_id=$project_id

    # add bookshelf entry:
    $ sparrow plg run gcp-data-store-bookshelf \
    --param project_id=$project_id --param action=add  \
    --param title="War and Peace" \
    --param author="Лев Николаевич Толстой" \
    --param desciption="School Reading"

# Parameters

## project_id

Should be a Google project ID


# Author

Alexey Melezhik

# See also

* [Cloud Datastore Client Libraries](https://cloud.google.com/datastore/docs/reference/libraries)
* [Google Cloud Authentication](http://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud/v0.44.0/guides/authentication)

