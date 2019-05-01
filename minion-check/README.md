# SYNOPSIS

verify your minion workers, jobs

# INSTALL
    
    $ sparrow plg install minion-check
    
# USAGE
  
    $ sparrow project create web-app
    $ sparrow task add web-app minion minion-check
    $ sparrow task ini web-app minion
  
    # in case you use carton install
    command = cd /path/to/your/mojo/app && carton exec ./app.pl minion

    # sets worker footprint to lookup at processes list
    worker_cmd = minion worker

    $ sparrow task run web-app minion


    <minion-tasks>
    
    /modules/check-worker/ started
    
    look up {{{minion worker}}} at proccess list ...
    sph       2748  0.3  3.4 202704 35216 pts/0    S    23:17   0:00 perl ./app.pl minion worker -m production -I 15 -j 2
    done
    ok      scenario succeeded
    ok      output match 'done'
    
    /modules/last-task/ started
    
    Q=0
    ok      scenario succeeded
    ok      output match /Q=(1|0)/
    
    / started
    
    no failed tasks found
    ok      0 failed jobs found
    STATUS  SUCCEED
    
# Parameters

## worker_cmd

    worker_cmd = minion worker

A footprint will be looked up at process list to identify if minion is alive 

## command

Bash script to run minion command, for example:

    command = cd /foo/bar && carton exec ./app.pl minion
    
## hitask

Sets checking time depth. In other words - checks failed tasks for last 5 minutes, 10 hours, 2 days , etc. For example:

    hitask = 10 minutes



# AUTHOR

[Alexey Melezhik](mailto:melezhik@gmail.com)

# See Also

[Minion Doc](https://metacpan.org/pod/Minion)


