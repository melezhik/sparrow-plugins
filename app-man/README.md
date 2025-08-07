# app-man

Start/Stop/Restart application using nohub command

# Install

    s6 --install app-man

# Usage

    # start application
    task-run "start app", "app-man", %(
        :action<start>,
        :bin</app/service>,
        :pid</app/run/service.pid>,
        :log</app/logs/app.log>,
    );

    # stop application
    task-run "stop app", "app-man", %(
        :action<stop>,
        :bin</app/service>,
        :pid</app/run/service.pid>
    );

    # restart application
    task-run "restart app", "app-man", %(
        :action<restart>,
        :bin</app/service>,
        :pid</app/run/service.pid>
    );


# Parameters

## action

`start|stop|restart`. Optional. Default value is `start`

## bin

Path to binary to run. Optional. Default value is `/app/bin/main`

## pid

Path to pid file. Optional. Default value is `/app/run/app.pid`

## log

Path to log file. Optional. Default value is `/app/log/app.log`

## user

Runs app as user. Optional. Default is not set.

# Author

Alexey Melezhik
