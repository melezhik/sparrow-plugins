# SYNOPSIS

Smart beagle to find suspicious entries in your logs for period of time.

# INSTALL

    $ s6 --install logdog

# CONFIGURATION

/logdog/README

/logdog/README

    $ s6 --task-set nginx/500-errors 

    # all the configuration
    # should be kept under
    # `logdog' section
    
    <logdog>
    
    # set path to log file
      
    file = /var/log/nginx/access.log
    
    # this is examples of nginx log entries
    # 127.0.0.1 - - [24/Mar/2016:14:27:17 +0300] "GET / HTTP/1.1" 200 396 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0)
    
    # define how to extract time chunks 
    # from your log entries:
    
    # this should perl regexp:
    time_pattern  = \[(\d+\/\S+\/\d+):(\S+)
    
    # this should be posix strftime format
    # see `man strftime`
    time_format   = %d/%b/%Y %T
    
    # check logs for last 5 minutes
    hitask = 5 minutes
    
    # to proper time calculation 
    # need to know a timezone
    timezone = Europe/Moscow
    
    # I need 500 errors
    filter = HTTP\/\S+?"\s+500\s
    
    
    # group found entries by IP address:
    key_field = (\S+)
    
    
    # density - is optional parameter
    # show only groups with entries number more or equal 3 
    density = 3
    
    
    # check_mode
    
    # should be one of : zero|one_or_many|report
    # default value - report
    
    # group is a found entries grouped by key_field
    
    # zero - if zero group found test succeed
    # one_or_many - if one or many groups found - test succeed
    # report - test succeed always ( report mode - when you don't care whether or not any groups found )
    
    check_mode = report
    
    </logdog>
    
# USAGE

   s6 --task-run nginx/500-errors 

# AUTHOR

Alexey Melezhik
