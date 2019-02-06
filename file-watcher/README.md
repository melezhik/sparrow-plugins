# SYNOPSIS

Outthentic plugin.

Manage files in directory. You can use delete, move, copy files to local/remote destination when they are getting too old.

For remote copy/move used rsync.

# INSTALL

    $ sparrow plg install file-watcher

# USAGE

## via Sparrow boxes (with gogs-backuper plugin)
    
     $ cat ./backup.json

     [ 
       { "plugin" : "gogs-dockerized-backuper", 
         "task" : "backup gogs", 
         "data" : { 
           "docker" : 
             { "name" : "gogs }, 
           "destination" : "/clr/backup/gogs" 
         } 
       },
   
       { "plugin" : "file-watcher", 
         "task" : "delete old backups", 
         "data" : { 
            "action" : "delete",
            "dir" : "/clr/backup/gogs",
            "conditions" : {
              "older" : "14 days"
           } 
         } 
       }
     ]



# Parameters
## action
Action. Possible: `move|copy|delete`. No default value.

## directory
Target directory.

## conditions
In condition directive you can specify situation when we need do `action`. You can use `min` or `day`s for announced values.

### newer
It will find files in directory newer than value.

### older
It will find files in directory older than value.

## destination
Used only in 'copy|move' `action`.

### directory
A Local/remote directory for destination.

### server
A Domain/ip of remote `server`.

### user
A user for access to `server`.

### ssh\_private\_key
A ssh key file for `user`

# See also
[sparrowdo](https://github.com/melezhik/sparrowdo)

[sparrow](https://github.com/melezhik/sparrow)
